class RailwayStationsTrain < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :train

  validate :uniqueness_positions
  validate :time_true_sequence
  validate :positions_gap

  private

  def positions_gap
    if gap?(all_stations)
      errors.add(:base, "Номера станций должны быть последовательными")
    end
  end

  def time_true_sequence
    if all_stations.reject{ |station| station.position.nil? || station.position && station.position.zero?}.
        select { |station| position && station.position && station.position < position }.
        find { |station| time && station.time && station.time >= time }
      errors.add(:base, "Время не может быть меньше времени предыдущей станции")
    end
  end

  def uniqueness_positions
    if all_stations.reject { |station| station.id == id || (position && position.zero?) }.
        map { |station| station.position }.
        include?(position)
      errors.add(:base, "Позиции станций должны быть уникальными")
    end
  end

  def all_stations
    @all_stations ||= self.class.where(train: train)
  end

  def gap?(stations)
    last_position = 0
    (stations.reject { |station| station.id == id } << self).reject { |station| station.position.to_i.zero? }.sort_by(&:position).each do |station|
      return true if station.position != last_position + 1
      last_position += 1
    end
    false
  end

end