# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### association

- belongs_to :creator
- has_many :orders
- has_many :rooms
- has_many :room_users 
- has_many :comments
- has_many :destinations
- belongs_to :purchases


## destinationsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| post_num      | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### association

- belongs_to :user


## creatorsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| creator_name | string     | null: false                    |
| creator_text | text       | null: false                    |
| user         | references | null: false, foreign_key: true |

### association

- belongs_to :user
- has_many :projects 
- has_many :items


## ordersテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| order_name   | string     | null: false                    |
| order_text   | text       | null: false                    |
| order_price  | integer    | null: false                    |
| genre_id     | integer    | null: false                    |
| day          | integer    | null: false                    |
| creator      | references | null: false, foreign_key: true |

### association

- belongs_to :creator
- has_many :option
- has_many :rooms


## optionsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| option_name  | string     | null: false                    |
| option_price | integer    | null: false                    |
| project      | references | null: false, foreign_key: true |

### association

- belongs_to :project


## roomsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| project    | references | null: false, foreign_key: true |

### association

- belongs_to :project
- belongs_to :user
- has_many :messages


## messagesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| comment    | text       | null: false                    |
| room       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### association

- belongs_to :project
- belongs_to :user
- has_many :messages


## transactionsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| cost       | integer    | null: false                    |
| total_cost | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :room


## itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_name  | string     | null: false                    |
| item_text  | text       | null: false                    |
| item_price | integer    | null: false                    |
| genre_id   | integer    | null: false                    |
| postage_id | integer    | null: false                    |
| day_id     | integer    | null: false                    |
| creator    | references | null: false, foreign_key: true |

### association

- belongs_to :creator
- has_one :purchase


## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### association

- belongs_to :item
- belongs_to :user