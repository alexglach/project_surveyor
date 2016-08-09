class CreateMultipleChoiceQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :multiple_choice_questions do |t|
      t.boolean :one_answer
      t.text :question_text
      t.references :survey, foreign_key: true
      t.boolean :required
      t.timestamps
    end
  end
end
