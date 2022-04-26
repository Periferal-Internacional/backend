class AddUrlToDeliverables < ActiveRecord::Migration[7.0]
  def change
    add_column :deliverables, :url, :string, default: ""
  end
end
