# テーブル設計

## users テーブル

|  Column           |   Type   | Options     |
|  --------------   |  ------  | ----------- |
| nickname          |  string  | null: false |
| email             |  string  | null: false |
| password          |  string  | null: false |
| family_name       |  string  | null: false |
| first_name        |  string  | null: false |
| family_name_kana  |  string  | null: false |
| first_name_kana   |  string  | null: false |
| birthday          |  date    | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

|        Column          |   Type      | Options                        |
|  --------------------  |  ---------  | ------------------------------ |
| name                   |  string     | null: false                    |
| explanation            |  text       | null: false                    |
| category               |  integer    | null: false                    |
| status_id              |  integer    | null: false                    |
| shipping_charges_id    |  integer    | null: false                    |
| shipping_region_id     |  integer    | null: false                    |
| days_until_shipping_id |  integer    | null: false                    |
| selling_price          |  integer    | null: false                    |
| user                   | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

|     Column        |   Type      | Options                        |
|  --------------   |  ---------  | ------------------------------ |
| user              | references  | null: false, foreign_key: true |
| item              | references  | null: false, foreign_key: true |
### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address

## shipping_address テーブル

|     Column        |   Type      | Options                        |
|  --------------   |  ---------  | ------------------------------ |
| postal_code       |  string     | null: false                    |
| prefectures_id    |  integer    | null: false                    |
| city              |  string     | null: false                    |
| address           |  string     | null: false                    |
| building_name     |  string     |                                |
| phone_number      |  string     | null: false                    |
| purchase          | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase