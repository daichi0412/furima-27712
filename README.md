## usersテーブル
|Colmun|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|birthday|integer|null: false|
### Association
- has many:items
- has many: purchases
- has one: address

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|
|category|string|null: false|
|status|string|null: false|
|fee|string|null:false|
|area|string|null: false|
|days|string|null: false|
|price|string|null: false|
### Association
- belongs_to: users

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to: users
- has many: address, through: purchases_address

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|address|integer|null: false|
### Association
- belongs_to: users
- has many: purchases, through: purchases_address

## purchase_addressテーブル
|Column|Type|Options|
|------|----|-------|
|purchases_id|integer|null: false, foreign_key: true
|address_id|integer|null: false, foreign_key: true
### Associations
- belongs_to: purchases
- belongs_to: address