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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| price       | integer    | null: false                    |
| text        | string     | null: false                    |
| genre_id    | integer    | null: false                    |
| postage_id  | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| region_id   | integer    | null: false                    |
| post_day_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash :region
- belongs_to_active_hash :genre
- belongs_to_active_hash :postage
- belongs_to_active_hash :status
- belongs_to_active_hash :post_day

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| region_id    | integer    | null: false                    |
| city          | string     | null: false                    |
| build        | string     |                                |
| address      | string     | null: false                    |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

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

## postages

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

## post_days

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

## statuses

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

