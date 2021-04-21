class Like < ApplicationRecord
  validates_uniqueness_of :question_id, scope: :user_id
  belongs_to :user
  belongs_to :question
end
