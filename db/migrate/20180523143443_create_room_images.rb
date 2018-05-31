class CreateRoomImages < ActiveRecord::Migration[5.0]
  def change
    create_table :room_images do |t|
      t.string      :content, null: false
      t.integer     :status, null: false
      t.references  :room, foreign_key: true
      t.timestamps
    end
  end
end
