class AddPhoneNumberAndMiddleInitialToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :phone_number, :string
    add_column :tickets, :middle_initial, :string
  end
end
