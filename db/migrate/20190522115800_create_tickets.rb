class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :route_id
      t.integer :seats_number
      t.timestamps null: false
    end
  end
end
