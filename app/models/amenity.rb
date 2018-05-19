class Amenity < ApplicationRecord
  belongs_to :room, optional: true
end
