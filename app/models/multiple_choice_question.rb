class MultipleChoiceQuestion < ApplicationRecord
  has_many :options
  belongs_to :survey

  accepts_nested_attributes_for :options,
                                :reject_if => :all_blank,
                                :allow_destroy => true;
end
