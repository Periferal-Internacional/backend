class AddXp < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :xp_ji, :integer, default: 0
    add_column :users, :xp_jr, :integer, default: 0
    add_column :users, :xp_jm, :integer, default: 0
  end
end
