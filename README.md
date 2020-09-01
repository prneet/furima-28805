# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| name         | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| first_name_z | string | null: false |
| last_name_z  | string | null: false |
| first_name_k | string | null: false |
| last_name_k  | string | null: false |
| birthday     | string | null: false |

### Association

- has_many :item
- has_many :order

## items テーブル

| Column    | Type       | Options                        |
| ------    | ------     | -----------                    |
| name      | string     | null: false                    |
| price     | integer    | null: false                    |
| image     | string     | null: false                    |
| text      | string     | null: false                    |
| genre_id  | references | null: false, foreign_key: true |
| postage   | string     | null: false                    |
| status    | string     | null: false                    |
| region_id | references | null: false, foreign_key: true |
| post_day  | string     | null: false                    |
| user_id   | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash :region
- belongs_to_active_hash :genre

## orders テーブル

| Column    | Type       | Options                        |
| ------    | ------     | -----------                    |
| price     | integer    | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to_active_hash :region

## regions

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

## addresses テーブル
| Column       | Type       | Options                        |
| --------     | ------     | -----------                    |
| postal_code  | integer    | null: false                    |
| address      | string     | null: false                    |
| phone_number | integer    | null: false                    |
| order_id     | references | null: false, foreign_key: true |

### Association

- has_many :region
- belongs_to :order

## genres

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
