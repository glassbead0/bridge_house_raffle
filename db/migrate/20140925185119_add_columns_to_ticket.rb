class AddColumnsToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :number_of_tickets, :integer
    add_column :tickets, :payment_type, :string
    add_column :tickets, :amount_paid, :decimal
    add_column :tickets, :last_four_digits_of_card, :string
  end
end
