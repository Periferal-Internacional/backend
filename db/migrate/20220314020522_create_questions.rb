class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :prompt, null: false
      t.string :right_answer, null: false
      t.string :answers, array: true, default: []
      t.string :question_type, null: false
      t.timestamps
    end
  end
end
