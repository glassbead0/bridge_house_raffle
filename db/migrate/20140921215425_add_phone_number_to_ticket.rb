class AddPhoneNumberToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :phone_number, :string
  end
end
