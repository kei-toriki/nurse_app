class Best < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :answer
  validates :question_id, uniqueness: { scope: :user_id }
end
