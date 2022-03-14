class CreateDocumentations < ActiveRecord::Migration[7.0]
  def change
    create_table :documentations, id: :uuid do |t|
      t.string :name, null: false
      t.string :doc_type, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
