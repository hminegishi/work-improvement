# アプリ名
work-improvement

# 概要
- ユーザー登録をしたユーザーが自身の記事を投稿し業務改善の記録を残したり他ユーザーとの情報共有などができる。
- 他ユーザーはコメントにて記事の感想を入力できる。
- 記事内容の検索ができる。

# 制作背景（意図）
前職での経験で企業の立ち上げに携わる機会があり、今までに行なったことがない業務をこなさなくてはならない状態を経験。経理や業務効率、書類作成など１つ１つ検索しなくてはならなく大変だったので、様々な業種の改善記録や注意点、工夫している部分などをまとめて記載されているようなアプリケーションがあれば便利と思い作成に至った。

# DEMO

## トップページ
[![Image from Gyazo](https://i.gyazo.com/97b5145961d35458eec1593cd90fc30c.gif)](https://gyazo.com/97b5145961d35458eec1593cd90fc30c)

## ユーザー登録画面
[![Image from Gyazo](https://i.gyazo.com/9ccdf7017d217b7818a5cc534ab67777.gif)](https://gyazo.com/9ccdf7017d217b7818a5cc534ab67777)

## 新規投稿画面
[![Image from Gyazo](https://i.gyazo.com/8c9df3ac2411a07d4293be13852b391c.gif)](https://gyazo.com/8c9df3ac2411a07d4293be13852b391c)

## マイページ
[![Image from Gyazo](https://i.gyazo.com/6050ec3cb671ebc12b48983524f666a9.gif)](https://gyazo.com/6050ec3cb671ebc12b48983524f666a9)

## 内容編集画面
[![Image from Gyazo](https://i.gyazo.com/19d99091c87cb605a038daab75c434d9.gif)](https://gyazo.com/19d99091c87cb605a038daab75c434d9)

# 実装予定
タグ付け機能の実装と全体レイアウトを再考予定

# 使用技術（開発環境）

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
Html, Css

## データベース
MySQL, SequelPro

## ソース管理
GitHub, GitHubDesktop

## エディタ
VSCode

# DB設計

## users テーブル

| Column             | Type        | Options                  |
| ------------------ | ----------- | ------------------------ |
| nickname           | string      | null: false              |
| email              | string      | unique:true, null: false |
| encrypted_password | string      | null: false              |
| name               | string      | null: false              |

### Association

- has_many :articles
- has_many :comments

## articles テーブル

| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| title                | string      | null: false                    |
| text                 | text        | null: false                    |
| user                 | references  | null: false, foreign_key: true |
| category             | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :category
- has_many   :comments
- has_one_attached :image

## comment テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| text             | text        | null: false                    |
| user             | references  | null: false, foreign_key: true |
| article          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :article
