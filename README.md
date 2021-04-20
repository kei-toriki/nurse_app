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
- has_many :question_tags
- has_many :tags, through: :question_tags

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
| user      | references | null: false, foreign_key: true |
| answer    | references | null: false, foreign_key: true |
| question  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :question
- belongs_to :answer

## tags テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| name      | string     | null: false, uniqueness: true  |

- has_many :question_tags
- has_many :questions, through: :question_tags

## question_tags テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| question  | references | null: false, foreign_key: true |
| tag       | references | null: false, foreign_key: true |

- belongs_to :question
- belongs_to :tag







