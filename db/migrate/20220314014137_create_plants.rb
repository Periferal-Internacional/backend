class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants, id: :uuid do |t|
      t.string :city, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
