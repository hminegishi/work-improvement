# テーブル設計

## users テーブル

| Column             | Type        | Options                  |
| ------------------ | ----------- | ------------------------ |
| nickname           | string      | null: false              |
| email              | string      | unique:true, null: false |
| encrypted_password | string      | null: false              |
| name               | string      | null: false              |
| birthday           | date        | null: false              |

### Association

- has_many :items
- has_many :buyers

## articles テーブル

| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| image                | string      |                                |
| text                 | text        | null: false                    |
| user                 | references  | null: false, foreign_key: true |
| category             | integer     | null: false, foreign_key: true |
| tag                  | integer     | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :category
- has_many   :comments

## category テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

## comment テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| text             | text        | null: false                    |
| user             | references  | null: false, foreign_key: true |
| article          | references  | null: false, foreign_key: true |

### Association

- belongs_to :buyer