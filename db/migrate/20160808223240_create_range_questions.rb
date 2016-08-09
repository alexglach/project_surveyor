class CreateRangeQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :range_questions do |t|
      t.references :survey, foreign_key: true
      t.string :range_min
      t.string :range_max
      t.string :step
      t.text :question_text
      t.boolean :required
      t.timestamps
    end
  end
end
