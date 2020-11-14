# テーブル設計

## users テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_one :profile
- has_many :items
- has_many :orders
- has_many :liquidations

## profiles テーブル
| Column           | Type            | Options                        |
| ---------------- | --------------- | ------------------------------ |
| first_name       | string          | null: false                    |
| last_name        | string          | null: false                    |
| first_name_kana  | string          | null: false                    |
| last_name_kana   | string          | null: false                    |
| birthday         | data            | null: false                    |
| user             | references      | null: false, foreign_key: true |

### Association
- belongs_to :user

## items テーブル
| Column       | Type          | Options                        |
| ------------ | ------------- | ------------------------------ |
| image        | ActiveStorage | null: false                    |
| name         | string        | null: false                    |
| description  | text          | null: false                    |
| category     | references    | null: false, foreign_key: true |
| condition    | references    | null: false, foreign_key: true |
| price        | integer       | null: false                    |
| shipping     | references    | null: false, foreign_key: true |
| prefecture   | references    | null: false, foreign_key: true |
| days_to_ship | references    | null: false, foreign_key: true |
| user         | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping
- belongs_to :prefecture
- belongs_to :days_to_ship
- has_many :orders


## orders テーブル
| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postal_code   | varchar(7)  | null: false                    |
| prefecture    | references  | null: false, foreign_key: true |
| address_after | string      | null: false                    |
| building_name | string      | null: false                    |
| phone_number  | varchar(11) | null: false                    |
| user          | references  | null: false, foreign_key: true |
| items         | references  | null: false, foreign_key: true |
| liquidation   | references  | null: false, foreign_key: true |

### Association
- belongs_to :prefecture
- belongs_to :user
- belongs_to :item
- belongs_to :liquidation

## liquidations テーブル
| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| credit_card_number | string      | null: false                    |
| expiration         | string      | null: false                    |
| security_code      | string      | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :orders


## categorys (active_hash)
### Association
- has_many :items

## conditions (active_hash)
### Association
- has_many :items

## shippings (active_hash)
### Association
- has_many :items

## days_to_ships (active_hash)
### Association
- has_many :items

## prefectures (active_hash)
### Association
- has_many :items
- has_many :orders