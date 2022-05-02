class AddMissingKpIs < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mdp_b4, :integer, default: 0
    add_column :users, :mdp_aft, :integer, default: 0
    add_column :users, :waste_b4, :integer, default: 0
    add_column :users, :waste_aft, :integer, default: 0
    add_column :users, :format_b4, :integer, default: 0
    add_column :users, :format_aft, :integer, default: 0
  end
end
