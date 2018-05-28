class RoomImage < ApplicationRecord
  belongs_to :room, optional: true
  mount_uploader :content, RoomImageUploader
  enum status: %i(main sub)
end
