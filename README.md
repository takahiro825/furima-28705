# テーブル設計

## users テーブル

|  Column           |   Type   | Options     |
|  --------------   |  ------  | ----------- |
| nickname          |  string  | null: false |
| email             |  string  | null: false |
| password          |  string  | null: false |
| family_name       |  string  | null: false |
| first_name        |  string  | null: false |
| family_name(kana) |  string  | null: false |
| first_name(kana)  |  string  | null: false |
| birthday          |  date    | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

|     Column          |   Type      | Options                        |
|  -----------------  |  ---------  | ------------------------------ |
| item_name           |  string     | null: false                    |
| item_explanation    |  integer    | null: false                    |
| category            |  integer    | null: false                    |
| item_status         |  integer    | null: false                    |
| shipping_charges    |  integer    | null: false                    |
| shipping_region     |  integer    | null: false                    |
| days_until_shipping |  integer    | null: false                    |
| selling_price       |  string     | null: false                    |
| user                | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases

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
| city              |  string     | null: false                    |
| address           |  string     | null: false                    |
| building_name     |  string     |                                |
| phone_number      |  string     | null: false                    |
| purchase          | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase