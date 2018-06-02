class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_images, dependent: :destroy
  has_many :reservations, dependent: :destroy

  enum gender:{男性: 0, 女性: 1, その他: 2}
  enum language:{日本語: 0, English: 1, 繁体字: 2, 簡体字: 3}
  enum currency:{円: 0, ドル: 1, 元: 2, ユーロ: 3}
end
