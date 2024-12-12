class CreateSpaces < ActiveRecord::Migration[8.0]
  def change
    create_table :spaces do |t|
      t.references :circle, null: false, foreign_key: true
      t.text :name, null: false

      t.timestamps
    end
    add_index :spaces, :name
  end
end
