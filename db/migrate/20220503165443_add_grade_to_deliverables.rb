class AddGradeToDeliverables < ActiveRecord::Migration[7.0]
  def change
    add_column :deliverables, :grade, :integer, default: 0
  end
end
