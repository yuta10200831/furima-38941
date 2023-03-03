## users テーブル

| Column              | Type       | Options                              |
| ------------------  | ---------- | ------------------------------       |
| nickname            | string     | null: false                          |
| email               | string     | null: false , unique: true           |
| family_name         | string     | null: false                          |
| first_name          | string     | null: false                          |
| family_name_kana    | string     | null: false                          |
| first_name_kana     | string     | null: false                          |
| encrypted_password  | string     | null: false                          |
| birth_day           | date       | null: false                          |

### Association

- has_many :items


## items テーブル

| Column             | Type       | Options                              |
| ------             | ---------- | ------------------------------       |
| item_name          | string     | null: false                          |
| explanation        | text       | null: false                          |
| category_id        | integer    | null: false                          |
| situation_id       | integer    | null: false                          |
| delivery_charge_id | integer    | null: false                          |
| sender_id          | integer    | null: false                          |
| number_of_days_id  | integer    | null: false                          |
| price              | integer    | null: false                          |
| user               | references | null: false , foreign_key: true      |

### Association

- belongs_to :user
- has_one :purchase

## purchaseｓ テーブル

| Column           | Type       | Options                              |
| ----------       | ---------- | ------------------------------       |
| post_code        | string     | null: false                          |
| sender_id        | integer    | null: false                          |
| city             | string     | null: false                          |
| city_number      | string     | null: false                          |
| building_name    | string     |                                      |
| telephone_number | string     | null: false                          |
| user             | references | null: false , foreign_key: true      |
| item             | references | null: false , foreign_key: true      |

### Association
- belongs_to :item
- belongs_to :card

## card テーブル
| Column           | Type       | Options                                    |
| ----------       | ---------- | -----------------------------------------  |
| user             | references | null: false foreign_key: true              |
| item             | references | null: false foreign_key: true              |

- has_one :purchase