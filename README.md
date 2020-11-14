# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | data   | null: false |

### Association
- has_many :items
- has_many :liquidations

## items テーブル
| Column       | Type          | Options                        |
| ------------ | ------------- | ------------------------------ |
| name         | string        | null: false                    |
| description  | text          | null: false                    |
| category     | integer       | null: false                    |
| condition    | integer       | null: false                    |
| price        | integer       | null: false                    |
| shipping     | integer       | null: false                    |
| prefecture   | integer       | null: false                    |
| days_to_ship | integer       | null: false                    |
| user         | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping
- belongs_to :prefecture
- belongs_to :days_to_ship


## orders テーブル
| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postal_code   | string      | null: false                    |
| address_after | string      | null: false                    |
| building_name | string      | null: false                    |
| phone_number  | string      | null: false                    |

### Association
- has_one :liquidation

## liquidations テーブル
| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| credit_card_number | string      | null: false                    |
| expiration         | string      | null: false                    |
| security_code      | string      | null: false                    |
| user               | references  | null: false, foreign_key: true |
| order              | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order


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
