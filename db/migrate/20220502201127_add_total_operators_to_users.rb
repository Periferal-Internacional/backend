class AddTotalOperatorsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :total_operators, :integer, default: 0
  end
end
