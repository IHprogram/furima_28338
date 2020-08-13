# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false |
| password             | string  | null: false |
| first_name           | string  | null: false |
| family_name          | string  | null: false |
| first_name_furigana  | string  | null: false |
| family_name_furigana | string  | null: false |
| birth_day            | date    | null: false |

### Association

- has_many :items
- has_many :buyers
- has_many :receivers

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| content          | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| date_of_shipment | string     | null: false                    |
| delivery_fee     | string     | null: false                    |
| prefecture       | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :receiver
- has_one :buyer

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- has_one :receiver
- belongs_to :user
- belongs_to :item

## receivers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| buyer_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buyer
