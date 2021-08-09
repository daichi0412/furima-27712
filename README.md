## usersテーブル
|Colmun|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has many:items, through: users_items
- has many: users_items
- has one: purchases

## users_itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to: users
- belongs_to: items


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|
|name|string|null: false|
|text|text|
|price|string|
### Association
- has many: users, through: users_items
- has many: users_items


## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|credit|integer|null: false|
|address|integer|null: false|
|tel|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to: users