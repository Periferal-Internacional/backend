class AddXpQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :xp, :integer, default: 0
  end
end
