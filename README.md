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
|Column----|Type------|Options---|
|----------|----------|----------|
|nickname--|string----|null: false|
|email|string|null: false, unique: true|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|-------|
|profile|text|-------|
### Association
- has_one :profile, dependent: :destroy
- has_one :credit
<!-- アソシエーションが1対1の関係の時は、どちらかをhas_one、もう一方をbelongs_toにする。 -->
- has_many :creditcards, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :solditems, dependent: :destroy


## addressesテーブル
|Column---------|Type-----------|Options--------|
|---------------|---------------|---------------|
|postcode-------|string---------|null: false----|
|prefecture-----|string---------|null: false----|
|municipality---|string---------|null: false----|
|address--------|string---------|null: false----|
|room_number----|string---------|---------------|
|phone----------|integer--------|null: false----|
|user_id--------|integer--------|null: false, foreign_key: true|    /  references
### Association
- belongs_to :user


<!-- ## creditcardsテーブル   ※DBではなくpay.jpにて管理
|Column|Type|Options|
|------|----|-------|
|cardnumber|integer|null: false, unique: true|
|expirationdata|integer|null: false|
|securitycode|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user -->

※セキュリティの観点から、クレジットカードの番号やCVCをDBに保存してはいけない。
 そのため、payjpにて生成される、customer_id(永続利用)を保存する
## creditテーブル
|Column---------|Type-----------|Options--------|
|---------------|---------------|---------------|
|user_id--------|integer--------|null: false, foreign_key: true|    /  references
|customer_id----|string---------|null: false----|  ※pay.jpの永続利用
|card_id--------|string---------|---------------|
### Association
- belongs_to :user


## itemsテーブル
|Column---------|Type-----------|Options--------|
|---------------|---------------|---------------|
|name-----------|string---------|null: false----|
|explanation----|text-----------|null: false----|
|brand----------|string---------|---------------|
|condition------|string---------|null: false----|
|postage--------|integer--------|null: false----|
|area-----------|string---------|null: false----|
|days-----------|integer--------|null: false----|
|price----------|integer--------|null: false----|
|user_id--------|integer--------|null: false, foreign_key: true|    /  references
|category_id----|integer--------|null: false, foreign_key: true|    /  references
|status---------|integer--------|null: false----|
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
|Column---------|Type------------|Options--------|
|---------------|----------------|---------------|
|name-----------|string----------|null: false, index: true|
|ancestory------|string----------|親子関係---------|
### Association
- has_many :items ,dependent: :destroy
- has_ancestry
<!-- ancestryはジェムの追加をあわせて行う（エラーが出る為） -->


<!-- ## item_categoriesテーブル    ※ gem'ancestory'を使用する場合は中間テーブル不要
|Column|Type|Options|
|------|----|-------|
|category_id|string|null: false, foreign_key: true|
|item_id|string|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :category -->


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