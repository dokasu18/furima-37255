# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | string | null: false               |



### Association
- has_many :items
- has_one :purchasers

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| comment    | text       | null: false                    |
| category   | string     | null: false                    |
| condition  | string     | null: false                    |
| cost       | string     | null: false                    |
| area       | string     | null: false                    |
| date       | string     | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## purchasers テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
