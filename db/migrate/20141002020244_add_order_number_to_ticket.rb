class AddOrderNumberToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :order_number, :integer
  end
end
