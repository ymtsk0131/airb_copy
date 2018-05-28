class ChangeContentOfRoomImage < ActiveRecord::Migration[5.0]
  def change
    change_column_null :room_images, :content, true
    change_column_null :room_images, :status, true
  end
end
