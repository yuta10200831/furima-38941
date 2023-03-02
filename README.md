## user テーブル

| Column              | Type       | Options                              |
| ------------------  | ---------- | ------------------------------       |
| nickname            | string     | NOT NULL                             |
| email               | string     | NOT NULL                             |
| family_name         | string     | NOT NULL                             |
| first_name          | string     | NOT NULL                             |
| family_name_kana    | string     | NOT NULL                             |
| first_name_kana     | string     | NOT NULL                             |
| password            | string     | NOT NULL                             |
| birth_day           | date       | NOT NULL                             |

### Association

- has_many :items
- has_many :purchase
- belong_to :card


## items テーブル

| Column       | Type       | Options                              |
| ------       | ---------- | ------------------------------       |
| image        | text       | NOT NULL                             |
| item_name    | string     | NOT NULL                             |
| explanation  | text       | NOT NULL                             |
| comment      | string     | NOT NULL                             |
| detail       | text       | NOT NULL                             |
| price        | integer    | NOT NULL                             |
| user_id      | references | NOT NULL,外部ｷｰ                       |

### Association

- belongs_to :user
- has_one :purchase


## purchase テーブル

| Column           | Type       | Options                              |
| ----------       | ---------- | ------------------------------       |
| post_code        | text       | NOT NULL                             |
| prefectures      | string     | NOT NULL                             |
| city             | string     | NOT NULL                             |
| city_number      | string     | NOT NULL                             |
| building_name    | string     | NOT NULL                             |
| telephone_number | integer    | NOT NULL                             |
| user_id          | references | NOT NULL,外部ｷｰ                       |
| item_id          | references | NOT NULL,外部ｷｰ                       |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :card

## card テーブル
| Column           | Type       | Options                                    |
| ----------       | ---------- | -----------------------------------------  |
| card_id          | text       | NOT NULL                                   |
| user_id          | references | NOT NULL,外部ｷｰ                             |

- belongs_to :user
- belongs_to :purchase