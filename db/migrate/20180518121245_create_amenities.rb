class CreateAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :amenities do |t|
      t.boolean  :essentials
      t.boolean :wifi
      t.boolean :shampoo
      t.boolean :closet
      t.boolean :tv
      t.boolean :heat
      t.boolean :air_condditioner
      t.boolean :breakfast
      t.boolean :workspace
      t.boolean :fireplace
      t.boolean :iron
      t.boolean :hair_dryer
      t.boolean :animals
      t.boolean :private_entrance
      t.boolean :smoke_detector
      t.boolean :carbon_monoxide_detector
      t.boolean :first_aid_kit
      t.boolean :safety_card
      t.boolean :fire_extinguisher
      t.boolean :bedroom_lock
      t.boolean :private_livingroom
      t.boolean :pool
      t.boolean :kitchen
      t.boolean :laundry_washer
      t.boolean :laundry_dryer
      t.boolean :parking
      t.boolean :elevator
      t.boolean :hot_tub
      t.boolean :gym
      t.timestamps
    end
  end
end
