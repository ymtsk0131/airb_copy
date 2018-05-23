# README

Airbnbのコピーサイトの作成。
宿泊予約に関するシステムの実装を目指します。
・ユーザーは部屋をの登録し、ホストになれる。
・ユーザーは部屋の予約ができる。
・ユーザーは部屋に対してレビューをつけられる。
・ユーザーとホストは予約に紐付いてメッセージのやりとりができる。

# DB設計

## usersテーブル
|Column|Type|Option|
|------|----|------|
|firstname|string|null: false|
|lastname|string|null: false|
|gender|integer|null: false|
|birthday|date|null: false|
|email|string|null: false|
|phone|integer|null: false|
|language|integer||
|currency|integer||
|address|string||
|introduction|text||

### Association
- has_many :rooms, dependent: :destroy
- has_many :reservations, dependent: :destroy
- has_many :reviews, dependent: :destroy
- has_many :user_images, dependent: :destroy
- has_many :messages, dependent: :destroy

## user_imagesテーブル
|Column|Type|Option|
|------|----|------|
|content|string|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to :user

## roomsテーブル
|Column|Type|Option|
|------|----|------|
|category|integer|null: false|
|property_type|integer|null: false|
|room_type|integer|null: false|
|occupied|boolean|null: false|
|capacity|integer|null: false|
|bedrooms|integer|null: false|
|beds|integer|null: false|
|bathrooms|integer|null: false|
|bathroom_private|boolean|null: false|
|location|string|null: false|
|summary|text|null: false|
|family|boolean||
|group|boolean||
|pets|boolean||
|other|text||
|reservation_deadline|integer||
|check_in_from|integer||
|check_in_to|integer||
|min_stay|integer||
|max_stay|integer||
|base_price|integer||
|user|references|foreign_key: true|
|amenity|references|foreign_key: true|
|house_rule|references|foreign_key: true|
|notice|references|foreign_key: true|

### Association
- belongs_to :user
- has_one :amenity, dependent: :destroy
- has_one :house_rule, dependent: :destroy
- has_one :notice, dependent: :destroy
- has_many :reservations, dependent: :destroy
- has_many :reviews, dependent: :destroy
- has_many :room_images, dependent: :destroy

## room_imagesテーブル
|Column|Type|Option|
|------|----|------|
|content|string|null: false|
|status|integer|null: false|
|room|references|foreign_key: true|

### Association
- belongs_to :room


## amenitiesテーブル
|Column|Type|Option|
|------|----|------|
|essentials|boolean||
|wifi|boolean||
|shampoo|boolean||
|closet|boolean||
|tv|boolean||
|heat|boolean||
|air_condditioner|boolean||
|breakfast|boolean||
|workspace|boolean||
|fireplace|boolean||
|iron|boolean||
|hair_dryer|boolean||
|animals|boolean||
|private_entrance|boolean||
|smoke_detector|boolean||
|carbon_monoxide_detector|boolean||
|first_aid_kit|boolean|||
|safety_card|boolean||
|fire_extinguisher|boolean||
|bedroom_lock|boolean||
|private_livingroom|boolean||
|pool|boolean||
|kitchen|boolean||
|laundry_washer|boolean||
|laundry_dryer|boolean||
|parking|boolean||
|elevator|boolean||
|hot_tub|boolean||
|gym|boolean||
|room|references|foreign_key: true|


### Association
- belongs_to :room

## house_rulesテーブル
|Column|Type|Option|
|------|----|------|
|name|strings||
|children|boolean||
|infants|boolean||
|pets|boolean||
|smoking|boolean||
|events|boolean||
|other_rules|text||

### Association
- belongs_to :room

## noticesテーブル
|Column|Type|Option|
|------|----|------|
|must_climb_stairs|boolean||
|potential_for_noise|boolean||
|pets_live_on_property|boolean||
|no_parking_on_property|boolean||
|some_spaces_are_shared|boolean||
|amenity_limitations|boolean||
|surveillance_or_recording_devices_on_property|boolean||
|weapons_on_property|boolean||
|dangerous_animals_on_property|boolean||
|other_notice|text||

### Association
- belongs_to :room

## reservationsテーブル
|Column|Type|Option|
|------|----|------|
|date|date|null: false|
|guests|integer|null: false|
|user|references|foreign_key: true|
|room|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :room
- has_many :messages, dependent: :destroy

## messagesテーブル
|Column|Type|Option|
|------|----|------|
|content|string|null: false|
|image|string||
|user|references|foreign_key: true|
|reservation|references|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :reservation

## reviewsテーブル
|Column|Type|Option|
|------|----|------|
|rate_toal|integer|null: false|
|rate_accuracy|integer|null: false|
|rate_location|integer|null: false|
|rate_communication|integer|null: false|
|rate_Check_in|integer|null: false|
|rate_cleanliness|integer|null: false|
|rate_value|integer|null: false|
|content|text|null: false|
|user|references|foreign_key: true|
|room|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :room
