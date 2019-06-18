class RemovePriceFromRoutes < ActiveRecord::Migration
  def change
    remove_column :routes, :price
  end
end
