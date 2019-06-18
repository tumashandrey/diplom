class AddPricesToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :seat_price, :decimal
    add_column :routes, :second_place_price, :decimal
    add_column :routes, :coupe_price, :decimal
  end
end
