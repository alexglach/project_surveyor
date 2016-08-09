class Survey < ApplicationRecord
  has_many :multiple_choice_questions
  has_many :range_questions
end
