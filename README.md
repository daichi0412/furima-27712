## usersテーブル
|Colmun|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false, unique: true|
|birthday|integer|null: false|
### Association
- has many:items
- has many: purchases

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|text|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|fee_id|integer|null: false|
|area_id|integer|null: false|
|days_id|integer|null: false|
|price|decimal|null: false|
### Association
- belongs_to: users

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to: users
- has one: address

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|address|integer|null: false|
### Association
- belongs_to: purchases

