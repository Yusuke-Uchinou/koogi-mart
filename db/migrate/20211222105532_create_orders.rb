class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_name, null: false
      t.text :order_text, null: false
      t.integer :order_price, null: false
      t.integer :order_price_max, null: false
      t.integer :genre_id, null: false
      t.integer :day, null: false
      t.references :creator, null: false, foreign_key: true
      t.timestamps
    end
  end
end
