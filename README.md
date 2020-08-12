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
| birth_year           | integer | null: false |
| birth_month          | integer | null: false |
| birth_day            | integer | null: false |

### Association

- has_many :items
- has_many :carriers
- has_many :receivers
- has_many :creditcards

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| content       | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| user_nickname | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :receiver
- has_one :creditcard
- has_one :carrier

## carriers テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| date_of_shipment    | string     | null: false                    |
| delivery_fee        | string     | null: false                    |
| prefecture          | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## creditcards テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| card_number         | integer    | null: false                    |
| expiration_month    | integer    | null: false                    |
| expiration_year     | integer    | null: false                    |
| security_code       | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## receivers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
