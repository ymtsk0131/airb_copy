class Room < ApplicationRecord
  belongs_to :user
  has_one :amenity, dependent: :destroy
  has_one :house_rule, dependent: :destroy
  has_one :notice, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :room_images, dependent: :destroy
  accepts_nested_attributes_for :amenity
  accepts_nested_attributes_for :room_images, reject_if: :reject_room_images

  enum category:{マンション・アパート:0, 住宅:1, サブユニット:2, ユニークな施設:3,　B＆B:4, デザイナーズホテル他:5}
  enum propeety_type:{建物タイプ１:0, 建物タイプ２:1, 建物タイプ３:2, 建物タイプ４:3, 建物タイプ５:4}
  enum room_type:{住宅全体:0,　個室:1,　シェアルーム:2}
  enum status:{公開:0, 非公開:1}

  def reject_room_images(attributed)
    attributed['content'].blank?
  end
end
