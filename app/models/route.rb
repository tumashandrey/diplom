class Route < ActiveRecord::Base

  SEATS_TYPE = {
    seat: 'Сидячее место',
    second_place: 'Плацкарт',
    coupe: 'Купе',
  }

  belongs_to :train
  has_many :railway_stations, through: :train
  has_many :users
  has_many :tickets

  before_validation :set_name
  validates :name, presence: true
  validates :train, presence: true
  before_destroy :check_for_destroy

  scope :filtered, ->(filter_params) {
    date = DateTime.parse(filter_params[:date])
    joins(%(
JOIN trains as t ON routes.train_id = t.id
JOIN railway_stations_trains as rst_start ON t.id = rst_start.train_id
JOIN railway_stations_trains as rst_finish ON t.id = rst_finish.train_id
))
      .where(
        %(
rst_start.railway_station_id = :from_station
AND rst_finish.railway_station_id = :to_station
AND rst_start.time > :start_day
AND rst_start.time < :finish_day
AND rst_start.position < rst_finish.position
),
        from_station: filter_params[:from],
        to_station: filter_params[:to],
        start_day: date.strftime('%F 00:00:00'),
        finish_day: date.strftime('%F 23:59:59')
      )
  }

  def available_seats
    (train.seat_capacity + train.second_place_capacity + train.coupe_capacity) - Ticket.tickets_by_route(self).count
  end

  def seats_available?(seats_type)
    train.send("#{seats_type}_capacity") - Ticket.tickets_by_route_and_type(self, seats_type).count > 0
  end

  def start_time
    train.railway_stations_trains.min_by(&:position).time.strftime('%F %X')
  end

  def finish_time
    train.railway_stations_trains.max_by(&:position).time.strftime('%F %X')
  end

  def route_text
    railway_stations.map(&:title).join(' - ')
  end

  def self.seats_type_to_text(seats_type)
    SEATS_TYPE[seats_type.to_sym]
  end

  private

  def set_name
    self.name = [
      train.railway_stations_trains.min_by(&:position).railway_station.title,
      '-',
      train.railway_stations_trains.max_by(&:position).railway_station.title,
    ].join(' ')
  end

  def check_for_destroy
    false if tickets.any?
  end
end
