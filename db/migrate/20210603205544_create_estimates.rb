class CreateEstimates < ActiveRecord::Migration[6.0]
  def change
    create_table :estimates do |t|

      t.timestamps
    end
  end
end
