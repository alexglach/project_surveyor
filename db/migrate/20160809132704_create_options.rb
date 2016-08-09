class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :answer
      t.references :multiple_choice_question, foreign_key: true
      t.timestamps
    end
  end
end
