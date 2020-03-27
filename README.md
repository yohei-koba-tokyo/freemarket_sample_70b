# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation   以下参照

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...





## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer||
|profile|text||
### Association
- has_one :address, dependent: :destroy
- has_one :credit
<!-- アソシエーションが1対1の関係の時は、どちらかをhas_one、もう一方をbelongs_toにする。 -->
- has_many :creditcards, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :solditems, dependent: :destroy

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|string|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|room_number|string||
|phone|integer||
|sendname_last|string|null: false|
|sendname_first|string|null: false|
|sendname_last_kana|string|null: false|
|sendname_first_kana|string|null: false|
|user_id|integer|null: false, foreign_key: true|    /  references
### Association
- belongs_to :user


※セキュリティの観点から、クレジットカードの番号やCVCをDBに保存してはいけない。
 そのため、payjpにて生成される、customer_id(永続利用)を保存する
## creditテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|    /  references
|customer_id|string|null: false|  ※pay.jpの永続利用
|card_id|string||
### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|brand|string||
|condition|string|null: false|
|postage|integer|null: false|
|area|string|null: false|
|days|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|    /  references
|category_id|integer|null: false, foreign_key: true|    /  references
|status|integer|null: false|
### Association
- belongs_to :user
- belongs_to :category
- has_one :solditem, dependent: :destroy
- has_many :itemimages, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy


## itemimagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|string|null: false, foreign_key: true|     /  references
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
|name|string|null: false, index: true|
|ancestory|gem|※親子関係|
### Association
- has_many :items
<!-- ancestryはジェムの追加をあわせて行う（エラーが出る為） -->


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|    /  references
|user_id|integer|null: false, foreign_key: true|    /  references
|comment|text|null: false|
### Association
- belongs_to :item
- belongs_to :user


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|    /  references
|user_id|integer|null: false, foreign_key: true|    /  references
### Association
- belongs_to :item
- belongs_to :user


