class AddDataToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :business, :string, default: ""
    add_column :users, :general_area, :string, default: ""
    add_column :users, :superior_department, :string, default: ""
    add_column :users, :department, :string, default: ""
    add_column :users, :arca_id, :integer, default: 0
    add_column :users, :email, :string, default: ""
  end
end
