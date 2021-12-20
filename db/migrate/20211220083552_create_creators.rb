class CreateCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :creators do |t|
      t.string :creator_name, null: false
      t.text :creator_text, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
