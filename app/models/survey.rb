class Survey < ApplicationRecord
  has_many :multiple_choice_questions
  has_many :range_questions
  accepts_nested_attributes_for :multiple_choice_questions,
                                :reject_if => :all_blank,
                                :allow_destroy => true;

  accepts_nested_attributes_for :range_questions,
                                :reject_if => :all_blank,
                                :allow_destroy => true;

  def self.create_mc_responses(params)
    params = params.to_hash
    return unless params["survey"].keys.include?("multiple_choice_questions_attributes")
    params["survey"]["multiple_choice_questions_attributes"].each do |new_response|
      next if new_response.nil?
      question = MultipleChoiceQuestion.find(new_response[1]["id"]) 
      new_response[1]["responses"].each do |response|
        next if response == ""
        question.responses.create(answer: response)
      end
    end

  end

  def self.create_range_responses(params)
    params = params.to_hash
    return unless params["survey"].keys.include?("range_questions_attributes")
    params["survey"]["range_questions_attributes"].each do |new_response|
      next if new_response[1]["responses"] == ""
      question = RangeQuestion.find(new_response[1]["id"]) 
      question.responses.create(answer: new_response[1]["responses"])
    end

  end

end
