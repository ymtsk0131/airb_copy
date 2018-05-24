class RoomImage < ApplicationRecord
  belongs_to :room
  mount_uploader :content, RoomImageUploader
  enum status: %i(main sub)
end
