### usersテーブル
| Column             | Type   | Option                   |
| ------------------ | ------ | ------------------------ |
| name               | string | null:false               |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false,              |
<br>

### Association
- has_many :customers
- has_many :estimates
- has_many :user_items
- has_many :items, through: :user_items
<br>
<br>

### itemsテーブル
| Column                 | Type       | Option                        |
| ---------------------- | ---------- | ----------------------------- |
| name                   | string     | null:false                    |
| purchase_price         | integer    | null:false                    |
<br>

### Association
- has_many :estimates
- has_many :user_items
- has_many :users, through: :user_items
- has_many :customer_items
- has_many :customers, through: :customer_items
<br>
<br>

### customersテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| user          | references | null:false, foreign_key: true |
| item          | references | null:false, foreign_key: true |
| name          | string     | null:false                    |
<br>

### Association
- has_many :estimates
- has_many :customer_items
- has_many :items, through: :customer_items
- belongs_to :user
<br>
<br>

### estimatesテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| user          | references | null:false, foreign_key: true |
| item          | references | null:false, foreign_key: true |
| customer      | references | null:false, foreign_key: true |
| rate          | integer    | null:false                    |
| selling_price | integer    | null:false                    |
<br>

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :customer
<br>
<br>

### user_itemsテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| user          | references | null:false, foreign_key: true |
| item          | references | null:false, foreign_key: true |
<br>

### Association
- belongs_to :user
- belongs_to :item
<br>
<br>

### customer_itemsテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| item          | references | null:false, foreign_key: true |
| customer      | references | null:false, foreign_key: true |
<br>

### Association
- belongs_to :item
- belongs_to :customer