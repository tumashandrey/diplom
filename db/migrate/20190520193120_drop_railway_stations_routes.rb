class DropRailwayStationsRoutes < ActiveRecord::Migration
  def change
    drop_table :railway_stations_routes
  end
end
