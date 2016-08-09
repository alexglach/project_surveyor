class RangeQuestion < ApplicationRecord
  has_many :responses, :as => :responsable
  belongs_to :survey
  accepts_nested_attributes_for :responses,
                                :reject_if => :all_blank,
                                :allow_destroy => true;
end
