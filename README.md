# テーブル設計

## users テーブル

| Column                | Type     | Options     |
| ----------------------| -------- | ------------|
| nickname              | string   | null: false |
| email                 | string   | null: false |
| password              | string   | null: false |
| password_confirmation | string   | null: false |
| first_name            | string   | null: false |
| last_name             | string   | null: false |
| first_name_kana       | string   | null: false |
| last_name_kana        | string   | null: false |
| birth_date            | datetime | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| item_image    | string     | null: false                    |
| price         | string     | null: false                    |
| shipping_cost | string     | null: false                    |
| seller        | string     | null: false                    |
| category      | integer    | null: false                    |
| item_status   | string     | null: false                    |
| shipping_area | integer    | null: false, foreign_key: true |
| shipping_day  | integer    | null: false, foreign_key: true |

### Association

- belongs_to :purchase_records
- belongs_to :users

## purchase_records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| card_id      | string     | null: false                    |
| address      | string     | null: false, foreign_key: true |
| phone_number | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

## user_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| address      | text       | null: false, foreign_key: true |
| phone_number | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record


