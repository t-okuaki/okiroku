class CreatePaymentItemWorks < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_item_works do |t|
      t.references :payment_item, null: false, foreign_key: true

      # 本テーブルは記録用で、一度作成したレコードを消すことはないが、関連する work は消えるかもしれない。
      # work が将来的に消える可能性を考慮して、外部キー制約を外している。
      t.references :work, null: false, foreign_key: false

      t.text :work_name, null: false
      t.integer :work_count, null: false

      t.timestamps
    end
    add_index :payment_item_works, [ :payment_item_id, :work_id ], unique: true
    add_index :payment_item_works, :work_name
    add_index :payment_item_works, :work_count
  end
end
