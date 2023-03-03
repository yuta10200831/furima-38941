## user テーブル

| Column              | Type       | Options                              |
| ------------------  | ---------- | ------------------------------       |
| nickname            | string     | null: false                          |
| email               | string     | null: false , unique: true           |
| family_name         | string     | null: false                          |
| first_name          | string     | null: false                          |
| family_name_kana    | string     | null: false                          |
| first_name_kana     | string     | null: false                          |
| password            | string     | null: false                          |
| birth_day           | date       | null: false                          |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column          | Type       | Options                              |
| ------          | ---------- | ------------------------------       |
| item_name       | string     | null: false                          |
| explanation     | text       | null: false                          |
| category        | string     | null: false                          |
| situation       | string     | null: false                          |
| delivery_charge | string     | null: false                          |
| sender          | string     | null: false                          |
| number_of_days  | integer    | null: false                          |
| detail          | text       | null: false                          |
| price           | integer    | null: false                          |
| user            | references | null: false , foreign_key: true      |

### Association

- belongs_to :user
- has_one :purchase

## purchaseｓ テーブル

| Column           | Type       | Options                              |
| ----------       | ---------- | ------------------------------       |
| post_code        | string     | null: false                          |
| :category_id     | string     | null: false                          |
| city             | string     | null: false                          |
| city_number      | string     | null: false                          |
| building_name    | string     |                                      |
| telephone_number | string     | null: false                          |

### Association
- belongs_to :item
- has_one :card

## card テーブル
| Column           | Type       | Options                                    |
| ----------       | ---------- | -----------------------------------------  |
| user             | references | foreign_key: true                          |
| item             | references | foreign_key: true                          |

- belongs_to :purchase