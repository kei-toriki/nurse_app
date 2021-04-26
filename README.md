# ナースの質問部屋

# アプリケーション概要
・このアプリはQ&Aサイトとなっています。
またアプリケーション名の通り看護師がメインとしたQ&Aサイトとなっており、ログイン時に職種の入力が必要であること(看護師以外でも医療職であればログイン可能)や質問をする際にも医療に関するジャンル選択が必要となっています。

# 本番環境
http://35.73.173.20/

## ログイン情報(テスト用)

### テスト1

email: test1abc@gmail.com

パスワード: 1234abc



### テスト2

ユーザー名: test2abc@gmail.com

パスワード: 1234abc

### basic認証

user : nurse

password :1954

# 作成意図
こちらはQ&Aサイトになっており、特徴的なのは看護師を始め医療職に特化したQ&Aサイトになっています。

看護師や医療の現場では病態に関する知識やその分析力が非常に重要です。しかし現場ではなかなか業務多忙であり、しっかりと学習する環境がないことがおおいため、より手軽に知識を深められる場所をつくりたいと考えました。


そこで日々の業務の中で疑問に思ったことや医療関連のニュースをみてどう思ったか等気軽にコミュニケーションを取れる場をつくりたいと考えたため看護師や医療職に特化したQ&Aサイトがあると、良いと考えたため作成しました。


# DEMO
## TOPページ
[![Image from Gyazo](https://i.gyazo.com/ca8ec94eab07eb89b392c3bd0c51c477.jpg)](https://gyazo.com/ca8ec94eab07eb89b392c3bd0c51c477)
トップページではすぐに質問内容が一覧で表示されており、どの様なサイトかが分かるようにログイン時と同じ表示になっています。
未ログイン時のユーザーでも一覧と詳細の確認を行うことができます。

## 新規登録・ログイン
[![Image from Gyazo](https://i.gyazo.com/18c543bc9a58f16e9949dd589ae18477.gif)](https://gyazo.com/18c543bc9a58f16e9949dd589ae18477)
deviseを使用し新規登録、ログイン機能を実装しました。

新規登録画面では基本医療者の使用となるため役職が必須項目となっております。

そして新規登録が終了するとログインされ、すべての機能を使用することができるようになります。またヘッダー右上に登録した名前とアバターが表示されます。

## 質問機能
[![Image from Gyazo](https://i.gyazo.com/421ed3c8a90bf436f212ccf40201214c.gif)](https://gyazo.com/421ed3c8a90bf436f212ccf40201214c)

一覧ページから質問記入ページに遷移し、質問を送信すると一覧ページにリダイレクトし、投稿内容が表示されます。

また投稿の際にはジャンルが必須となっており、医療関連の質問となるように制約しています。

またジャンルで選んだこと以外に情報を付け加えたい際にはタグ機能も作成したためそちらに記入します。

## アンサー機能
[![Image from Gyazo](https://i.gyazo.com/518cd149ce80f112a72b900d01f1b8b0.gif)](https://gyazo.com/518cd149ce80f112a72b900d01f1b8b0)

質問の詳細ページから回答することができます。回答することで詳細ページに回答が表示されます。

## ベストアンサー機能
[![Image from Gyazo](https://i.gyazo.com/aa7d91b9764a4fba5a550c8548f899db.gif)](https://gyazo.com/aa7d91b9764a4fba5a550c8548f899db)

質問者は集められた回答の中1つだけ、ベストアンサーを選びそれを表示させることができます。

## 共感！機能
[![Image from Gyazo](https://i.gyazo.com/03e5c220c7112dc4a64012e6e85cc2a5.gif)](https://gyazo.com/03e5c220c7112dc4a64012e6e85cc2a5)

投稿に対して1人のユーザー1回共感ボタンをおすことができます。

直感的に操作ができるようにJQueryを用いて非同期通信での仕様となっています。

## 検索機能
[![Image from Gyazo](https://i.gyazo.com/7b72b1d13c1f52d7f00135a77397739f.gif)](https://gyazo.com/7b72b1d13c1f52d7f00135a77397739f)

検索内容に関連する投稿を抽出して表示することができます。

※その他編集や削除もできますがここでは割愛します。

# 工夫したポイント
・トップページを投稿一覧画面とし、新規登録やログインをしていなくても質問内容や質問詳細が見れるようになっています。

・新規投稿時役職の入力が必須となっており、基本は医療職者のみの使用ができるようになっています。

・検索機能を実装し、関連する文字列から該当する質問が絞り込むことができるようにしています。

・ベストアンサー機能を実装し、よりよい回答が多くの人に伝わるようにしています。

・共感！機能を使用し、直感的に操作できるように非同期通信での実装をしました。

# 使用技術
## サーバーサイド
Ruby, Ruby on Rails

## フロントエンド
HTML, CSS, JavaScript, JQuery

## データベース
MySQL SequelPro

## インフラ
AWS(EC2,S3),Capistarano,Docker

## webサーバ(本番環境)
nginx

## webアプリケーション(本番環境)
unicorn

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
 - has_many :likes

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
- has_many :likes

## answers テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| question  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :question
- has_one :bests

## bests テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| answer    | references | null: false, foreign_key: true |
| question  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :question
- belongs_to :answer

## tags テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| name      | string     | null: false, uniqueness: true  |

### Association
- has_many :question_tags
- has_many :questions, through: :question_tags

## question_tags テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| question  | references | null: false, foreign_key: true |
| tag       | references | null: false, foreign_key: true |

### Association
- belongs_to :question
- belongs_to :tag

## likes テーブル
| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| question  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :question





