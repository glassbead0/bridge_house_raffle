class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.belongs_to :admin

      t.timestamps
    end
  end
end
