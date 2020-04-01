# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# FreemarketSample72a DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email   |string|null: false, unique: true|
|password|string|null: false|
### Association
- has_one :profile, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :delivery_destination, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :buyer_items, foreign_key: "buyer_id", class_name: 'Items'
- has_many :buyer_items, foreign_key: "buyer_id", class_name: 'Items'

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id         |references|null: false, foreign_key: true|
|family_name     |string    |null: false|
|first_name      |string    |null: false|
|family_name_kana|string    |null: false|
|first_name_kana |string    |null: false|
|birth_year      |date      |null: false|
|birth_month     |date      |null: false|
|birth_day       |date      |null: false|
### Association
- belongs_to :user

## delivery_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id                     |references|null: false, foreign_key: true|
|destination_family_name     |string    |null: false|
|destination_first_name      |string    |null: false|
|destination_family_name_kana|string    |null: false|
|destination_first_name_kana |string    |null: false|
|postal_code                 |integer(7)|null: false|
|prefecture                  |string    |null: false|
|city                        |string    |null: false|
|house_number                |string    |null: false|
|building_name               |string    |-|
|phone_number                |integer   |unique: true|
### Association
- belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id         |references|null: false, foreign_key: true|
|card_number     |integer   |null: false, unique: true|
|expiration_year |integer   |null: false|
|expiration_month|integer   |null: false|
|security_code   |integer   |null: false|
### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|content|text      |null: false|
### Association
- belongs_to :item
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name          |string    |null: false|
|description   |text      |null: false|
|category_id   |references|null: false, foreign_key: true|
|brand_id      |references|foreign_key: true|
|condition     |string    |null: false|
|postage_payer |string    |null: false|
|shipping_from |string    |null: false|
|necessary_days|string    |null: false|
|price         |integer   |null: false|
|seller_id     |references|null: false, foreign_key: true|
|buyer_id      |references|foreign_key: true|
### Association
- has_many :item_images, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :seller, class_name: 'User'
- belongs_to :buyer, class_name: 'User'

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image  |string    |null: false|
|item_id|references|foreign_key: true|
### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items