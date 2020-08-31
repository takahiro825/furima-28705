# テーブル設計

## users テーブル

|  Column    |   Type   | Options     |
|  -------   |  ------  | ----------- |
| nickname   |  string  | null: false |
| email      |  string  | null: false |
| password   |  string  | null: false |
| name       |  string  | null: false |
| name(kana) |  string  | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

|     Column       |   Type      | Options                        |
|  --------------  |  ---------  | ------------------------------ |
| item_name        |  string     | null: false                    |
| item_explanation |  text       | null: false                    |
| selling_price    |  string     | null: false                    |
| user_id          | references  | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

|     Column        |   Type      | Options                        |
|  --------------   |  ---------  | ------------------------------ |
| card_information  | string      | null: false                    |
| expiration_date   | string      | null: false                    |
| security_cade     | string      | null: false                    |
| user_id           | references  | null: false, foreign_key: true |
| item_id           | references  | null: false, foreign_key: true |
### Association

- belongs_to :items
- belongs_to :users
- has_one :shipping_address

## shipping_address テーブル

|     Column        |   Type      | Options                        |
|  --------------   |  ---------  | ------------------------------ |
| postal_code       |  string     | null: false                    |
| city              |  string     | null: false                    |
| address           |  string     | null: false                    |
| building_name     |  string     |                                |
| phone_number      |  string     | null: false                    |
| purchase_id       | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchases