class Train < ActiveRecord::Base
  has_many :railway_stations, through: :railway_stations_trains
  has_many :railway_stations_trains
  has_many :routes
  before_destroy :destroy_railway_stations_train
  before_destroy :check_for_destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validate :stations_count

  def stations_text
    railway_stations_trains.reject do |railway_stations_train|
      railway_stations_train.railway_station.title.nil? || railway_stations_train.time.nil?
    end.map do |railway_stations_train|
      "#{railway_stations_train.railway_station.title} (#{railway_stations_train.time.strftime('%F %X')})"
    end.join('-')
  end

  private

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Должно быть минимум 2 станции")
    end
  end

  def destroy_railway_stations_train
    railway_stations_trains.destroy_all
  end

  def check_for_destroy
    false if routes.any?
  end

end