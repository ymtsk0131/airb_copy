class AddStatusToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :status, :integer
  end
end
