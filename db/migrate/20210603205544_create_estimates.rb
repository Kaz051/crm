class CreateEstimates < ActiveRecord::Migration[6.0]
  def change
    create_table :estimates do |t|
      t.references :user,          null: false, foreign_key: true
      t.references :item,          null: false, foreign_key: true
      t.references :customer,      null: false, foreign_key: true
      t.integer    :selling_price, null: false
      t.timestamps
    end
  end
end
