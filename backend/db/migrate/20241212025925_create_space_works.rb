class CreateSpaceWorks < ActiveRecord::Migration[8.0]
  def change
    create_table :space_works do |t|
      t.references :space, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true
      t.integer :work_count, null: false

      t.timestamps
    end
    add_index :space_works, [ :space_id, :work_id  ], unique: true
    add_index :space_works, :work_count
  end
end
