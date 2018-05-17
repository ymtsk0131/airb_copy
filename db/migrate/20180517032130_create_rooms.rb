class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :category, null: false
      t.integer :property_type, null: false
      t.integer :room_type, null: false
      t.boolean :occupied, null: false
      t.integer :capacity, null: false
      t.integer :bedrooms, null: false
      t.integer :beds, null: false
      t.integer :bathrooms, null: false
      t.boolean :bathroom_private, null: false
      t.string  :location, null: false
      t.text    :summary, null: false
      t.boolean :family
      t.boolean :group
      t.boolean :pets
      t.text    :other
      t.integer :reservation_deadline
      t.integer :check_in_from
      t.integer :check_in_to
      t.integer :min_stay
      t.integer :max_stay
      t.integer :base_price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
