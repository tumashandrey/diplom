class AddColumnsToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :train_type, :string
    add_column :trains, :seat_capacity, :integer
    add_column :trains, :second_place_capacity, :integer
    add_column :trains, :coupe_capacity, :integer
  end
end
