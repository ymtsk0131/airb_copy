class RoomImage < ApplicationRecord

  belongs_to :room

  enum status:{main:0, sub:1}

  validates :content,
            :status,
            presence: true
end
