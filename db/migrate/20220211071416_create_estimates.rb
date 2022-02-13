class CreateEstimates < ActiveRecord::Migration[6.0]
  def change
    create_table :estimates do |t|
      t.integer :estmate_price, null: false
      t.text :estimate_text
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
