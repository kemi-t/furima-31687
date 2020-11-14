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
| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| name            | string        | null: false                    |
| description_id  | text          | null: false                    |
| category_id     | integer       | null: false                    |
| condition_id    | integer       | null: false                    |
| price           | integer       | null: false                    |
| shipping_id     | integer       | null: false                    |
| prefecture_id   | integer       | null: false                    |
| days_to_ship_id | integer       | null: false                    |
| user_id         | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping
- belongs_to :prefecture
- belongs_to :days_to_ship
- has_one :liquidation


## orders テーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| postal_code    | string      | null: false                    |
| prefecture_id  | integer     | null: false                    |
| municipality   | string      | null: false                    |
| address        | string      | null: false                    |
| building_name  | string      |                                |
| phone_number   | string      | null: false                    |
| liquidation_id | references  | null: false, foreign_key: true |

### Association
- belongs_to :liquidation
- belongs_to :prefecture

## liquidations テーブル
| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user_id            | references  | null: false, foreign_key: true |
| items_id           | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
- has_one :order


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
