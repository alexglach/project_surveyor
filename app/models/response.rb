class Response < ApplicationRecord
  belongs_to :responsable, :polymorphic => true
end
