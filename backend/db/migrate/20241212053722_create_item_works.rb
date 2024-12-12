class CreateItemWorks < ActiveRecord::Migration[8.0]
  def change
    create_table :item_works do |t|
      t.references :item, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true
      t.integer :work_count, null: false

      t.timestamps
    end
    add_index :item_works, [ :item_id, :work_id ], unique: true
    add_index :item_works, :work_count
  end
end
