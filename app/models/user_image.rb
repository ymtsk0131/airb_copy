class UserImage < ApplicationRecord
  belongs_to :user
  mount_uploader :content, ImageUploader
end
