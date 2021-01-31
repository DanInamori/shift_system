## アプリケーション名
 ### Shift System

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
    1. テスト用アカウントのアルバイトスタッフAでログイン
    2. シフトを提出するスケジュール(1月前半など)を選択
    3. シフトを提出ボタンをクリック
    4. 希望シフトを記入して提出ボタンをクリック
    5. 提出シフトを確認するをクリックして確認できる

  - 新しくシフト作成者になる方法
    1. テスト用アカウントのアルバイトスタッフAでログイン
    2. 左の三本線のアイコン、または上記の店名をクリック
    3. 右下のペンマークをクリック→シフト作成者を選択

  - シフト作成者が提出されたシフトの確認方法
    1. テスト用アカウントのシフト作成者でログイン
    2. シフトを確認するスケジュール(1月前半など)を選択
    3. 左上の提出シフト一覧をクリック(表示がなければ上記の「新しく作成者になる方法」を行う)

## 目指した課題解決
### 課題解決
 - シフト作成者がLINEなど他のツールで従業員の希望シフトを集めていたため時間の負担や手間が大きい
   - Shift Systemを使えば他のツールを使わず従業員のシフトを集められる
 - 集めたシフトをPCのExcelなどに手入力で打ち込むので時間的な手間に加えて入力の際に人為的なミスが出てしまう
   - PCに入力する必要がないため時間を短縮でき、人為的なミスがなくなる
 - 何件もアルバイトを掛け持ちしている従業員がシフトの提出のダブルブッキングをしてしまう
   - Shift System内に別の店の提出したアプリが保存されているため確認ができる

## 洗い出した用件
### 機能一覧
 1. ユーザー登録機能
 2. ルーム(会社名、店名 )作成機能
 3. スケジュール(シフトを提出する日数)作成機能
 4. シフト作成機能
 5. シフト作成者登録機能

### 各機能詳細
 1. ユーザー作成機能
    - ユーザーのアカウントを登録してアカウントの編集やログイン、ログアウトできる
 2. ルーム(会社名、店名 )作成機能
    - ルーム名に会社名や店名などを記載して、ルームのメンバーに従業員であるユーザーを登録することでルームメンバーのみのシフトを表示、確認することができます
 3. スケジュール(シフトを提出する日数)作成機能
    - スケジュールを作成することによって従業員がシフトの提出する日数を知ることができます
    - 提出する期間を定めることでシフト作成者は期間内のみのシフトを表示や確認をすることができます
 4. シフト作成機能
    - 従業員は希望シフト(例: 12:00~18:00, off, free など)を選択して提出して保管できます
    - 従業員は自分の提出したシフトのみ確認することができます
    - 保管された全従業員のシフトはシフト作成者のみスケジュール内のシフト一覧を表示して確認できます
 5. シフト作成者登録機能 
    - シフト作成者を登録することができます
    - シフト作成者に登録されるとシフト作成者にのみ表示されるボタン(スケジュール作成ボタン、従業員のシフト一覧表示ボタン)や画面(スケジュール作成画面、従業員のシフト一覧表示画面)が表示される


## 実装した機能についてのGIFと説明
### ユーザー登録機能


### ルーム作成機能


### スケジュール作成機能


### シフト提出機能


### シフト作成者登録機能



## 実装予定の機能
### 2021年3月目標の実装
 - 提出したシフトの編集機能の実装
 - 提出されたシフト一覧を編集して完成したシフトを表示する機能の実装
 - roomsテーブルにpasswordカラムを追加して、シフト作成者登録ページやルーム削除に制限をかける
 - ユーザー、ルームの画像登録機能の実装

### 2021年4月目標の実装
 - シフト提出でのコメント投稿機能の実装
 - ユーザー同士のチャット機能の実装
 - 友達登録機能の実装

### 2021年6月目標の実装
 - 自動で勤務時間数の計算機能の実装
 - シフト提出日での通知機能の実装

## データベース設計
  ![ER図](/shift_system.png)

## テーブル設計
### users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name_kanji     | string | null: false               |
| last_name_kanji      | string | null: false               |
| first_name_kana      | string | null: false               |
| last_name_kana       | string | null: false               |


#### Association

- has_many :rooms
- has_many :shift_creators
- has_many :shifts

### rooms テーブル

| Colum     | Type       | Options       |
| --------- | ---------- | ------------- |
| name      | string     | null: false   |

#### Association

- has_many: users
- has_many: shift_creators
- has_many: schedules

### shift_creators テーブル

| Colum     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| room      | references | null: false, foreign_key: true |

#### Association

- has_many: users
- belongs_to: room

### schedules テーブル

| Colum     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| room      | references | null: false, foreign_key: true |

#### Association

- has_many: shifts
- belongs_to: room

### shifts テーブル

| Colum     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| work_day  | date       | null: false                               |
| clock_in  | time       |                                |
| clock_out | time       |                                |
| check     | string     |                                |
| user      | references | null: false, foreign_key: true |
| schedule  | references | null: false, foreign_key: true |

#### Association

- belongs_to: user
- belongs_to: schedule


## ローカルでの操作方法



