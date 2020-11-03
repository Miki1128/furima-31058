# テーブル設計

## users テーブル

| Column                | Type     | Options     |
| ----------------------| -------- | ------------|
| nickname              | string   | null: false |
| email                 | string   | null: false |
| encrypted_password    | string   | null: false |
| first_name            | string   | null: false |
| last_name             | string   | null: false |
| first_name_kana       | string   | null: false |
| last_name_kana        | string   | null: false |
| birth_date            | date     | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| user_id       | references | null: false, foreign_key: true  |
| image         | string     | null: false                     |
| price         | integer    | null: false                     |
| shipping_cost | string     | null: false                     |
| category      | integer    | null: false                     |
| status        | string     | null: false                     |
| shipping_area | string     | null: false                     |
| shipping_day  | string     | null: false                     |

### Association

- has_one :purchase_record
- belongs_to :user

## purchase_records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :user_address

## user_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| purchase_record_id | references | foreign_key: true              |

### Association

- belongs_to :purchase_record


