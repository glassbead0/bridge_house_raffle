class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :subscribe, default: true
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
