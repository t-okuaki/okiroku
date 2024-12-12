class CreateWorks < ActiveRecord::Migration[8.0]
  def change
    create_table :works do |t|
      t.references :circle, null: false, foreign_key: true
      t.text :name, null: false
      t.bigint :standard_price, null: false

      t.timestamps
    end
    add_index :works, :name
    add_index :works, :standard_price
  end
end
