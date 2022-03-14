class CreateDeliverables < ActiveRecord::Migration[7.0]
  def change
    create_table :deliverables, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.boolean :approved, null: false, default: false
      t.text :comment
      t.string :deliverable_type, null: false

      t.timestamps
    end
  end
end
