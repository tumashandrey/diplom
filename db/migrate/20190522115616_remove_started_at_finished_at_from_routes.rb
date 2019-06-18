class RemoveStartedAtFinishedAtFromRoutes < ActiveRecord::Migration
  def change
    remove_column :routes, :started_at
    remove_column :routes, :finished_at
  end
end
