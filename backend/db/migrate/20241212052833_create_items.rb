class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.references :space, null: false, foreign_key: true
      t.text :name, null: false
      t.bigint :price, null: false

      t.timestamps
    end
    add_index :items, :name
    add_index :items, :price
  end
end
