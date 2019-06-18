class AddPriceToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :price, :decimal
  end
end
