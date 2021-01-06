# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |

### Association

- has_many :rooms
- has_many :shifts

## rooms テーブル

| Colum     | Type       | Options       |
| --------- | ---------- | ------------- |
| name      | string     | null: false   |

### Association

- has_many: users
- has_many: shifts

## shift テーブル

| Colum    | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| shift    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |
| comment  | text       |                                |

### Association

- belongs_to: user
- belongs_to: room