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
| user_id       | string     | null: false, foreign_key: true  |
| image         | string     | null: false                     |
| price         | integer    | null: false                     |
| shipping_cost | string     | null: false                     |
| seller        | string     | null: false                     |
| category      | integer    | null: false                     |
| status        | string     | null: false                     |
| shipping_area | string     | null: false                     |
| shipping_day  | string     | null: false                     |

### Association

- has_one :purchase_records
- belongs_to :users

## purchase_records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | string     | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users
- has_one :user_addresses

## user_addresses テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     |                                |
| house_number  | string     |                                |
| building_name | string     |                                |
| phone_number  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record


