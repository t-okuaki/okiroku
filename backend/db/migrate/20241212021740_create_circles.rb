class CreateCircles < ActiveRecord::Migration[8.0]
  def change
    create_table :circles do |t|
      t.references :owner, null: false, foreign_key:  { to_table: :users }
      t.text :name, null: false

      t.timestamps
    end
    add_index :circles, :name
  end
end
