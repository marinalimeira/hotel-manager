class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :days
      t.datetime :checkin
      t.datetime :checkout
      t.float :amount

      t.timestamps
    end
  end
end
