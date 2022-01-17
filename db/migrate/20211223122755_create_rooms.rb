class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :customer, null: false
      t.references :order, null: false, foreign_key: true
      t.references :owner, null: false
      t.timestamps
    end
  end
end
