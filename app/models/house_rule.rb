class HouseRule < ApplicationRecord
  belongs_to :room, optional: true
end
