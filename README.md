## usersテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|pseudonym_last|string|null: false|
|pseudonym_first|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false, unique: true|
|birthday|date|null: false|
### Association
- has many:items
- has many: purchases

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|user|references|foreign: true|
|category_id|integer|null: false|
|status_id|integer|null: false|
|fee_id|integer|null: false|
|area_id|integer|null: false|
|days_id|integer|null: false|
|price|decimal|null: false|
### Association
- belongs_to: user
- has one: purchase

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to: user
- belongs_to: item
- has one: address

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|code|string|null: false|
|prefectures|integer|null: false|
|city|string|null: false|
|address|integer|null: false|
|building|string|
|tel|string|null: false|
### Association
- belongs_to: purchase

