class CreatePaymentItems < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_items do |t|
      t.references :payment, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :space, null: false, foreign_key: true
      t.text :name, null: false
      t.bigint :price, null: false
      t.integer :count, null: false
      t.text :space_name, null: false

      t.timestamps
    end
    add_index :payment_items, :name
    add_index :payment_items, :price
    add_index :payment_items, :count
    add_index :payment_items, :space_name
  end
end
