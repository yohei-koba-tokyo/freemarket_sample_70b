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

以下DB設計を書く


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|-------|
|profile|text|-------|
### Association
- has_one :profile, dependent: :destroy
- has_many :creditcards, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :solditems, dependent: :destroy

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|string|-------|
|prefecture|string|-------|
|municipality|string|-------|
|address|string|-------|
|room_number|string|-------|
|phone|integer|-------|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|cardnumber|integer|null: false, unique: true|
|expirationdata|integer|null: false|
|securitycode|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|brand|string|-------|
|condition|string|null: false|
|postage|integer|null: false|
|area|string|null: false|
|days|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|status|integer|null: false|
### Association
- belongs_to :user
- has_one :solditem, dependent: :destroy
- has_many :item-images, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :item_categories, dependent: :destroy
- has_many :categories, through: :item_categories

## itemimagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|string|null: false, foreign_key: true|
### Association
- belongs_to :item

## solditemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestory|string|-------|
### Association
- has_many :item_categories ,dependent: :destroy
- has_many :items, through: :item_categories
- has_ancestry

## item_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|string|null: false, foreign_key: true|
|item_id|string|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :category

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|comment|text|null: false|
### Association
- belongs_to :item
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user