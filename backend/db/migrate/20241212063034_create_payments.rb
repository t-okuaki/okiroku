class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :circle, null: false, foreign_key: true
      t.bigint :price, null: false

      t.timestamps
    end
    add_index :payments, :price
  end
end
