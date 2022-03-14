class AddPlantReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :plant, foreign_key: true, type: :uuid, null: false
  end
end
