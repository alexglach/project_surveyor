class MultipleChoiceQuestion < ApplicationRecord
  has_many :options
  belongs_to :survey
  has_many :responses, :as => :responsable


  accepts_nested_attributes_for :options,
                                :reject_if => :all_blank,
                                :allow_destroy => true;
  accepts_nested_attributes_for :responses,
                                :reject_if => :all_blank,
                                :allow_destroy => true;




  def self.create_mc_responses(params)
    params.each do |new_response|
      question = MultipleChoiceQuestion.find(new_response[1]["id"]) 
      new_response[1]["responses"].each do |response|
        question.responses.create(answer: response, responsable_type: "MultipleChoiceQuestion", responsable_id: question.id)
      end
    end

  end

end
