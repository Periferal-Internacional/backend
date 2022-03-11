class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :lastName1
      t.string :lastName2
      t.string :position
      t.boolean :admin

      t.timestamps
    end
  end
end
