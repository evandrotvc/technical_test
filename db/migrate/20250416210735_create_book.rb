class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :status, default: 'avaliable'
      t.string :email

      t.timestamps
    end
  end
end
