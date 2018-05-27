class CreateHouseRules < ActiveRecord::Migration[5.0]
  def change
    create_table :house_rules do |t|
      t.boolean    :children
      t.boolean    :infants
      t.boolean    :pets
      t.boolean    :smoking
      t.boolean    :events
      t.text       :other_rules
      t.boolean    :must_climb_stairs
      t.boolean    :potential_for_noise
      t.boolean    :pets_live_on_property
      t.boolean    :no_parking_on_property
      t.boolean    :some_spaces_are_shared
      t.boolean    :amenity_limitations
      t.boolean    :surveillance_or_recording_devices_on_property
      t.boolean    :weapons_on_property
      t.boolean    :dangerous_animals_on_property
      t.text       :other_notice
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
