class AddRoomIdToAmenity < ActiveRecord::Migration[5.0]
  def change
    add_reference :amenities, :room, foreign_key: true
  end
end
