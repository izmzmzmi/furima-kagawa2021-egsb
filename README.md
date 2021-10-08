# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| family_name     | string | null: false |
| last-name-kana  | string | null: false |
| first-name-kana | string | null: false |
| user_birth_date | date   | null: false |

### Association

- has_many :item
- has_many :order


## items テーブル
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | text       | null: false                    |
| info                   | text       | null: false                    |
| category_id            | string     | null: false                    |
| sales_status_id        | string     | null: false                    |
| shipping_fee_status_id | string     | null: false                    |
| prefectures_id         | string     | null: false                    |
| scheduled_delivery_id  | string     | null: false                    |
| price                  | integer    | null: false                    |
| user_id                | integer    | null: false, foreign_key: true | 
| order_id               | integer    | null: false, foreign_key: true | 


### Association

- belongs_to :user
- has_one :order


## orders テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses



## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| addresses       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order_id       | integer    | null: false, foreign_key: true |


### Association

- belongs_to :order