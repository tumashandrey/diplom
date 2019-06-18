class AddSeatsTypeToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :seats_type, :string
  end
end
