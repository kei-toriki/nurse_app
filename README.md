# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |
| image      |        |             |

### Association

- has_many :questions
- has_many :answers
- has_many :bests
 
## questions テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| explanation | text       | null: false                    |
| genre_id    | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- has_many :answers
- belongs_to :user
- has_one :bests


## answers テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| question  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :question
- has_one :bests


## bests テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | text       | null: false, foreign_key: true |
| answer    | references | null: false, foreign_key: true |
| question  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :question
- belongs_to :answer



