class AddCapacityToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :capacity, :int
  end
end
