## アプリ名
CRM
## 概要
CRMは、顧客へ提案した商品の見積り単価を記録できるアプリです。  
顧客情報、商品情報を登録して、各顧客へ何をいくらで見積りしたのかを簡単に記録、確認できます。
## 本番環境
https://crm-35591.herokuapp.com/  
### Basic認証
- ユーザー名: admin
- パスワード: 2222  
### ログイン情報（テスト用）
- メールアドレス: 123@abc
- パスワード:123abc
## 制作背景（意図）  
外出中の営業マンが、単価の問合せ内容を簡単に記録できると便利だと思い、このアプリを制作しました。
外出中で急な問合せに対しても、それを整理して記録しておくことができます。また、社内で見積り内容を共有できるので、業務の「見える化」にも繋がります。
## DEMO  
### トップページ  
[![Image from Gyazo](https://i.gyazo.com/499201ff1ec48c0e4ac28789772b80f3.png)](https://gyazo.com/499201ff1ec48c0e4ac28789772b80f3)  
トップページには、顧客登録・商品登録・商品一覧のメニュー、登録した顧客名が表示されます。また、コメント投稿機能とその一覧も表示されます。コメント機能は非同期通信にしています。  
### 顧客登録画面  
[![Image from Gyazo](https://i.gyazo.com/14f3a710213c6d7eb64749c49282369c.png)](https://gyazo.com/14f3a710213c6d7eb64749c49282369c)  
顧客の登録ができます。  
### 商品登録画面  
[![Image from Gyazo](https://i.gyazo.com/0cc3c8587351b9fbb7575604a9db281f.png)](https://gyazo.com/0cc3c8587351b9fbb7575604a9db281f)
商品の登録ができます。  
### 商品一覧画面  
[![Image from Gyazo](https://i.gyazo.com/ef3ca4b80f5f060c677076292546c3d8.png)](https://gyazo.com/ef3ca4b80f5f060c677076292546c3d8)  
登録した商品の一覧が表示されます。  
### 顧客の詳細ページ  
[![Image from Gyazo](https://i.gyazo.com/ba931a37ce57d9bed5b3dac854c566a3.png)](https://gyazo.com/ba931a37ce57d9bed5b3dac854c566a3)  
顧客詳細ページには、顧客編集・顧客削除・ブックマークのメニューが表示されます。さらに見積り登録ができ、その一覧も表示されます。また見積り登録する際の商品選択は、登録した商品がプルダウンメニューで選択できます。  
### 顧客編集画面  
[![Image from Gyazo](https://i.gyazo.com/eaa4225fcfa2733b9a502dda66dd6f4a.png)](https://gyazo.com/eaa4225fcfa2733b9a502dda66dd6f4a)  
顧客名の編集ができます。  
### ユーザー詳細ページ  
[![Image from Gyazo](https://i.gyazo.com/4b9d1919f6a83e6580be8576f8625eb0.png)](https://gyazo.com/4b9d1919f6a83e6580be8576f8625eb0)  
ユーザーがブックマークした顧客の一覧が表示されます。
### 工夫したポイント  
- コメント投稿機能を実装することで、業務の見える化はもちろん、社員間のコミュニケーションツールとしても使えるようにしました。  
- ブックマーク機能を実装したので、マイページに自分の担当客を登録できます。  
- 見積り登録の商品選択をプルダウンメニューにしました。プルダウンメニューには、登録した商品名と仕入れ値が表示されるようにしています。  
## 使用技術(開発環境)  
### バックエンド  
Ruby, Ruby on Rails  
### フロントエンド
HTML, CSS, JavaScript, Ajax  
### データベース  
MySQL, SequelPro  
### ソース管理  
GitHub, GitHubDesktop  
### エディタ  
VSCode  
## 今後実装したい機能  
- 他ユーザーからの反応がわかるように、コメントへの「いいね」機能を追加したいです。
- 顧客詳細ページに所在地・電話番号等の会社情報を、ユーザー詳細ページにユーザーの所属部署等を表示できるように実装したいです。
- ユーザーが満足を体験できるように、ビューをもっと見やすいものに実装したいです。   
## DB設計  
### usersテーブル
| Column             | Type   | Option                   |
| ------------------ | ------ | ------------------------ |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false,              |
| name               | string | null:false               |  
### Association
- has_many :estimates
- has_many :bookmarks, dependent: :destroy
- has_many :posts  
### itemsテーブル
| Column                 | Type       | Option                        |
| ---------------------- | ---------- | ----------------------------- |
| name                   | string     | null:false                    |
| purchase_price         | integer    | null:false                    |  
### customersテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| name          | string     | null:false                    |  
### Association
- has_many :estimates, dependent: :destroy
- has_many :bookmarks, dependent: :destroy  
### estimatesテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| user          | references | null:false, foreign_key: true |
| customer      | references | null:false, foreign_key: true |
| item_name     | string     | null:false                    |
| selling_price | integer    | null:false                    |  
### Association
- belongs_to :customer
- belongs_to :user  
### bookmarksテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| user          | references | null:false, foreign_key: true |
| customer      | references | null:false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :customer  
### postsテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| user          | references | null:false, foreign_key: true |
| user_name     | string     | null:false                    |
| text          | text       | null:false                    |  
### Association
- belongs_to :user