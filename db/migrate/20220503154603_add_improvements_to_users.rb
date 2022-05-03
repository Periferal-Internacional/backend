class AddImprovementsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :improvements, :integer, default: 1
  end
end
