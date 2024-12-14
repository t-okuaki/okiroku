class CreatePaymentItemWorks < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_item_works do |t|
      t.references :payment_item, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true
      t.text :name, null: false
      t.integer :count, null: false

      t.timestamps
    end
    add_index :payment_item_works, [ :payment_item_id, :work_id ], unique: true
    add_index :payment_item_works, :name
    add_index :payment_item_works, :count
  end
end
