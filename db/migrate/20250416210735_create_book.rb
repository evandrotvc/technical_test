class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :status, default: 'avaliable'
      t.string :email

      t.timestamps
    end
  end

  # add_reference :books, :author, foreign_key: true, index: true
  # add_index :authors, :name
  # add_index :authors, :age
  # t.references :user, null: false, foreign_key: true

end
