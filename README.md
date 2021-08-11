## usersテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|pseudonym_last|string|null: false|
|pseudonym_first|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|birthday|date|null: false|
### Association
- has_many:items
- has_many: purchases

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|user|references|null: false, foreign_key: true|
|category_id|integer|null: false|
|status_id|integer|null: false|
|fee_id|integer|null: false|
|prefecture_id|integer|null: false|
|day_id|integer|null: false|
|price|integer|null: false|
### Association
- belongs_to: user
- has_one: purchase

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to: user
- belongs_to: item
- has_one: address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|
|tel|string|null: false|
|purchase|references|null: false, foreign_key: true|
### Association
- belongs_to: purchase

