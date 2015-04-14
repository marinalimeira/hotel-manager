class AddRoomIdToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :room_id, :integer
  end
end
