class CreateDocument < ActiveRecord::Migration[7.0]
  def change
    create_table :documents, id: :uuid do |t|

      t.binary :pdf_content, null: false
      t.string :description, null: false
      t.jsonb :document_data, null: false, default: '{}'
      t.timestamps
    end
  end
end
