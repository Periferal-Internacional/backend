class ChangeDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :mdp_b4, 1
    change_column_default :users, :mdp_aft, 1
    change_column_default :users, :waste_b4, 1
    change_column_default :users, :waste_aft, 1
    change_column_default :users, :format_b4, 1
    change_column_default :users, :format_aft, 1
    change_column_default :users, :total_operators, 1
  end
end
