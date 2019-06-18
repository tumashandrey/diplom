class RemoveCapacityFromTrain < ActiveRecord::Migration
  def change
    remove_column :trains, :capacity
  end
end
