## アプリケーション名
 ### Shift System

## 概要
 - シフト勤務の仕事で働いていてる従業員(シフトを作成する従業員又は、シフトを提出する従業員)が利用できるアプリケーションである。従来はシフトを作成する従業員はシフト提出日にLINEなどのSNSを使い従業員から勤務希望日を聞きPCのExcelに打ち込んでいた。この作業には作成までの時間がかかりすぎる上、手入力のため人為的な入力ミスが発生することが課題だった。それらの課題を解決するためのアプリケーションである。
  1. 従業員がシフトを提出できる。
  2. シフト作成者が提出されたシフトを見ることができる。
  - シフト作成者も従業員のためシフトを提出できる。

  ![システム図](/app/assets/images/要件定義image.png)

## URL
  - https://shift-system.herokuapp.com/

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
    1. テスト用アカウントのアルバイトスタッフAでログインする。
    2. シフトを提出するスケジュール(1月前半など)を選択する。
    3. シフトを提出ボタンをクリックする。
    4. 希望シフトを記入して提出ボタンをクリックする。
    5. 提出シフトを確認するをクリックして確認できる。

  - 新しくシフト作成者になる方法
    1. テスト用アカウントのアルバイトスタッフAでログインする。
    2. 左の三本線のアイコン、または上記の店名をクリックする。
    3. 右下のペンマークをクリック→シフト作成者を選択する。

  - シフト作成者が提出されたシフトの確認方法
    1. テスト用アカウントのシフト作成者でログインする。
    2. シフトを確認するスケジュール(1月前半など)を選択する。
    3. 左上の提出シフト一覧をクリックする。(表示がなければ上記の「新しくシフト作成者になる方法」を行う)

## 目指した課題解決
### 課題解決
 - シフト作成者がLINEなど他のツールで従業員の希望シフトを集めていたため時間の負担や手間が大きい。
   - Shift Systemを使えば他のツールを使わず従業員のシフトを集められる。
 - 集めたシフトをPCのExcelなどに手入力で打ち込むので時間的な手間に加えて入力の際に人為的なミスが出てしまう。
   - PCに入力する必要がないため時間を短縮でき、人為的なミスがなくなる。
 - 何件もアルバイトを掛け持ちしている従業員がシフトの提出のダブルブッキングをしてしまう。
   - Shift System内に別の店の提出したアプリが保存されているため確認ができる。

## 洗い出した用件
### 機能一覧
 1. ユーザー登録機能
 2. ルーム(会社名、店名 )作成機能
 3. スケジュール(シフトを提出する日数)作成機能
 4. シフト作成機能
 5. シフト作成者登録機能
 6. スケジュール検索機能

### 各機能詳細
 1. ユーザー作成機能
    - アプリケーションを利用するためのアカウントを新規作成する機能である。
    - 各従業員はアプリケーションを利用する前に必ずアカウントを作成する必要がある。
    - 新規作成には”ニックネーム”、”Eメール”、”パスワード”、”フルネーム(漢字)”、”フルネーム(カナ)”を入力する必要がある。
    - アカウント作成後はログインして、アプリケーションを利用することができる。
    ![ユーザー登録](https://github.com/DanInamori/shift_system/blob/Giftest/image/%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E7%99%BB%E9%8C%B2.gif)
    
 2. ルーム(会社名、店名 )作成機能
    - アカウント作成後はログインして、アプリケーションを利用することができる。
    - 新規作成には”ルーム名”、”所属メンバー”を入力する必要がある。
    - 名前には所属先である会社名や店名を記載する。
    - 従業員によっては複数の会社で働くためルームを複数持つことができる。
    ![ルーム作成](https://github.com/DanInamori/shift_system/blob/Giftest/image/%E3%83%AB%E3%83%BC%E3%83%A0%E4%BD%9C%E6%88%90.gif)

 3. スケジュール(シフトを提出する日数)作成機能
    - ルーム内でシフトを提出する際の日数を決めることができる機能である。
    - 提出する日数を定めることでシフト作成者は期間内のみのシフトの表示や確認をすることができる。
    - 新規作成には”スケジュール名”、”提出する初日の日程”、”提出する最終日の日程”を入力する必要がある。
    - シフト作成者のみがスケジュールを作成することができる。
    ![スケジュール作成](https://github.com/DanInamori/shift_system/blob/Giftest/image/%E3%82%B9%E3%82%B1%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E4%BD%9C%E6%88%90.gif)

 4. シフト提出機能
    - 従業員が提出するシフトを新規作成する機能である。
    - 従業員は希望シフト(例: 12:00~18:00, off, free など)を選択して提出することができる。
    - 従業員は自分の提出したシフトを確認することができる。
    - 保管された全従業員のシフトはシフト作成者のみスケジュール内でシフト一覧を表示して確認できる。
    ![シフト提出](https://github.com/DanInamori/shift_system/blob/Giftest/image/%E3%82%B7%E3%83%95%E3%83%88%E4%BD%9C%E6%88%90.gif)

 5. シフト作成者登録機能 
    - シフト作成者を登録することができる機能である。
    - シフト作成者に登録されるとシフト作成者にのみ表示されるボタン(スケジュール作成ボタン、従業員のシフト一覧表示ボタン)や画面(スケジュール作成画面、従業員のシフト一覧表示画面)が表示される。
    - シフト作成者は複数のユーザー登録することができる。
    ![シフト作成者登録](https://github.com/DanInamori/shift_system/blob/Giftest/image/%E3%82%B7%E3%83%95%E3%83%88%E4%BD%9C%E6%88%90%E8%80%85%E7%99%BB%E9%8C%B2.gif)

 6. スケジュール検索機能
    - スケジュールを検索する機能である。
    - スケジュール一覧画面の検索フォームに探したいスケジュールの名前を入力することによって、入力した文字が含まれているスケジュールが表示される。
    ![スケジュール検索](https://github.com/DanInamori/shift_system/blob/Giftest/image/%E3%82%B9%E3%82%B1%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E6%A4%9C%E7%B4%A2%E6%A9%9F%E8%83%BD.gif)


### 画面推移
    ![画面推移図](/image/画面推移image.png)


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
  ![ER図](/image/システム図image.png)

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
 ### 開発環境
  ruby: 2.6.5

 ### 操作手順
  1. 


