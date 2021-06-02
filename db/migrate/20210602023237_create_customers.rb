class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.references :user, type: :bigint, null:false, foreign_key: true
      t.string     :name,                null: false
      t.timestamps
    end
  end
end
