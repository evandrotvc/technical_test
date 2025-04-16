class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.integer :age
      t.timestamps
    end

    add_index :authors, :name
    add_index :authors, :age
  end
end
