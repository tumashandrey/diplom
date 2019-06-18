class RailwayStation < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  before_destroy :check_for_destroy

  has_many :trains, through: :railway_stations_train
  has_one :railway_stations_train
  has_many :routes, through: :railway_stations_train

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

  def check_for_destroy
    false if railway_stations_train
  end
end
