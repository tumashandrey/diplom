class AddTimeToRailwayStationsTrains < ActiveRecord::Migration
  def change
    add_column :railway_stations_trains, :time, :datetime
  end
end
