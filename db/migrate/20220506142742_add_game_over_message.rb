class AddGameOverMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :game_over_message, :string, default: '¡Esa no fue la respuesta correcta!'
  end
end
