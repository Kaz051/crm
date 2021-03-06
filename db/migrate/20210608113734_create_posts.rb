class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user,      null: false, foreign_key: true
      t.string     :user_name, null: false
      t.text       :text,      null: false
      t.timestamps
    end
  end
end
