# アプリケーション名
 **Shift System**

## 概要
 - シフト勤務で働いているユーザーが利用できるWebアプリケーション
  1. 従業員がシフトを提出できる
  2. シフト作成者が提出されたシフトを見ることができる

## URL

## テスト用アカウント
 ### シフト作成者
   - email abc1@gmail.com
   - password abcabc123
  
 ### アルバイトスタッフA
   - email abc2@gmail.com
   - password abcabc123

## 利用方法
  - WebブラウザGoogle Chromeの最新版を利用してアクセス
  - シフト提出方法
    - テスト用アカウントのアルバイトスタッフAでログイン→シフトを提出するスケジュール(1月前半など)を選択→シフトを提出ボタンをクリック→希望シフトを記入して提出ボタンをクリック→提出シフトを確認するをクリックして確認できる

  - 新しくシフト作成者になる方法
   - テスト用アカウントのアルバイトスタッフAでログイン→左の三本線のアイコン、または上記の店名をクリック→右下のペンマークをクリック→シフト作成者を選択

  - シフト作成者が提出されたシフトの確認方法
    - テスト用アカウントのシフト作成者でログイン→シフトを確認するスケジュール(1月前半など)を選択→左上の提出シフト一覧をクリック(表示がなければ上記の「新しく作成者になる方法」を行う)

## 目指した課題解決
### 課題
 - シフト作成者がLINEなど他のツールで従業員の希望シフトを集めていたため時間の負担や手間が大きい
 - 集めたシフトをPCのExcelなどに手入力で打ち込むので時間的な手間に加えて入力の際に人為的なミスが出てしまう
 - 何件もアルバイトを掛け持ちしている従業員がシフトの提出のダブルブッキングをしてしまう

### 解決
 - ShiftSystemを使えば他のツールを使わず従業員のシフトを集められる
 - PCに入力する必要がないため時間を短縮でき、人為的なミスがなくなる
 - ShiftSystem内に別の店の提出したアプリが保存されているため確認ができる

## 洗い出した用件
 - 

## 実装した機能についてのGIFと説明

## 実装予定の機能

## データベース設計

## ローカルでの操作方法


















# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |

### Association

- has_many :rooms
- has_many :schedules
- has_many :shifts

## rooms テーブル

| Colum     | Type       | Options       |
| --------- | ---------- | ------------- |
| name      | string     | null: false   |

### Association

- has_many: users
- has_many: schedules

## schedules テーブル

| Colum     | Type       | Options       |
| --------- | ---------- | ------------- |
| name      | string     | null: false   |

### Association

- has_many: users
- has_many: shifts
- belongs_to: room

## shift テーブル

| Colum    | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| shift    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |
| comment  | text       |                                |

### Association

- belongs_to: user
- belongs_to: schedule