class CreatePaymentItems < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_items do |t|
      t.references :payment, null: false, foreign_key: true

      # 本テーブルは記録用で、一度作成したレコードを消すことはないが、関連する item や space は消えるかもしれない。
      # item と space が将来的に消える可能性を考慮して、外部キー制約を外している。
      t.references :item, null: false, foreign_key: false
      t.references :space, null: false, foreign_key: false

      t.text :item_name, null: false
      t.bigint :item_price, null: false
      t.text :space_name, null: false

      t.timestamps
    end
    add_index :payment_items, :item_name
    add_index :payment_items, :item_price
    add_index :payment_items, :space_name
  end
end
