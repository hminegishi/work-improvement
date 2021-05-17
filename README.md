# テーブル設計

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
- has_many :article_tag_relations
- has_many :tags, through: :article_tag_relations


## category テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| work_name | string     | null: false                    |

### Association

- has_many    :articles

## comment テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| text             | text        | null: false                    |
| user             | references  | null: false, foreign_key: true |
| article          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :article

## tag テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| name             | string      | null: false                    |

### Association

- has_many :article_tag_relations
- has_many :articles, through: :article_tag_relations

## article_tag_relation テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| article          | references  | null: false, foreign_key: true |
| tag              | references  | null: false, foreign_key: true |

### Association

- belongs_to :article
- belongs_to :tag