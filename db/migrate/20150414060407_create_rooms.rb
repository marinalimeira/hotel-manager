class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :number
      t.boolean :available

      t.timestamps
    end
  end
end
