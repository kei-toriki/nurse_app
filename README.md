# ナースの質問部屋

# アプリケーション概要
・このアプリはQ&Aサイトとなっています。
またアプリケーション名の通り看護師がメインとしたQ&Aサイとなっており、ログイン時に職種の入力が必要であること(看護師以外でも医療職であればログイン可能)や質問をする際にも医療に関するジャンル選択が必要となっています。

# 本番環境
https://nurse-app-1954.herokuapp.com/

ログイン情報(テスト用)

## テスト1

email :212121@gmail.com

password :1234abc


## テスト2

email :232323@gmail.com

password :1234abc


## basic認証

user :

password :

# 作成意図
こちらはQ&Aサイトになっており、特徴的なのは看護師を始め医療職に特化したQ&Aサイトになっています。

看護師や医療の現場では病態に関する知識やその分析力が非常に重要です。しかし現場ではなかなか業務多忙であり、しっかりと学習する環境がないことがおおいため、より手軽に知識を深められる場所をつくりたいと考えました。


そこで日々の業務の中で疑問に思ったことや医療関連のニュースをみてどう思ったか等気軽にコミュニケーションを取れる場をつくりたいと考えたため看護師や医療職に特化したQ&Aサイトがあると、良いと考えたため作成しました。


# DEMO
随時更新します。

# 工夫したポイント
・トップページを投稿一覧画面とし、新規登録やログインをしていなくても質問内容や質問詳細が見れるようになっています。

・新規投稿時役職の入力が必須となっており、基本は医療職者のみの使用ができるようになっています。

・検索機能を実装し、関連する文字列から該当する質問が絞り込むことができるようにしています。

・ベストアンサー機能を実装し、よりよい回答が多くの人に伝わるようにしています。

# 使用技術
## サーバーサイド
ruby, ruby on rails

## フロントエンド
HTML, CSS

## データベース
MySQL SequelPro

## 開発環境
Docker

## 本番環境
heroku

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
初のオリジナルアプリであったため今回はサーバーサイドに重点を置いて開発を行いました。そのためフロントエンドの実装が不十分であったり、見た目にも改善する余地が多くあるので修正していきたいです。

またDRYの原則に基づいたコードの記載が甘いため、今後チーム開発のことも意識してコードの可読性を高める修正を行っていきたいと考えています。

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







