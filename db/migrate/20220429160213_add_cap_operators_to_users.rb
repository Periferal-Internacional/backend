class AddCapOperatorsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cap_operators, :integer, default: 0
  end
end
