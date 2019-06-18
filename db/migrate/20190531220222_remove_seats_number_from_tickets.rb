class RemoveSeatsNumberFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :seats_number
  end
end
