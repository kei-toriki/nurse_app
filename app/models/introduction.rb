class Introduction < ApplicationRecord
  belongs_to :user, optional: true
  validates :position, :description, presence: true
end
