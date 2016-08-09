class RangeQuestion < ApplicationRecord
  has_many :options, :as => :optionable
  belongs_to :survey
end
