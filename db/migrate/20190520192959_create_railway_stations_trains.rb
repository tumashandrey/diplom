class CreateRailwayStationsTrains < ActiveRecord::Migration
  def change
    create_table :railway_stations_trains do |t|
      t.integer :railway_station_id
      t.integer :train_id
      t.integer :position
    end
  end
end
