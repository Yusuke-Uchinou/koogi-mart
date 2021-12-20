class CreateCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :creators do |t|
      t.string :c_name, null: false
      t.text :c_text, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
