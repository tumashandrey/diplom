class AddTrainToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :train_id, :int
  end
end
