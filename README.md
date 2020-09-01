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
| birthday     | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ------      | ------     | -----------                    |
| name        | string     | null: false                    |
| price       | integer    | null: false                    |
| image       | string     | null: false                    |
| text        | string     | null: false                    |
| genre_id    | integer    | null: false                    |
| postage_id  | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| region_id   | integer    | null: false                    |
| post_day_id | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash :region
- belongs_to_active_hash :genre
- belongs_to_active_hash :postage
- belongs_to_active_hash :status
- belongs_to_active_hash :post_day

## orders テーブル

| Column    | Type       | Options                        |
| ------    | ------     | -----------                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## addresses テーブル
| Column       | Type       | Options                        |
| --------     | ------     | -----------                    |
| postal_code  | integer    | null: false                    |
| region_id    | integer    | null: false                    |
| address      | string     | null: false                    |
| phone_number | integer    | null: false                    |
| order_id     | references | null: false, foreign_key: true |

### Association

- has_many :regions
- belongs_to :order
- belongs_to_active_hash :region

## genres

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

## regions

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

## postage

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

## post_day

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

## status

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
