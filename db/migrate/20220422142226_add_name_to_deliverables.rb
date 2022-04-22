class AddNameToDeliverables < ActiveRecord::Migration[7.0]
  def change
    add_column :deliverables, :name, :string, default: ""
  end
end
