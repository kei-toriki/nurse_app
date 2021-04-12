class Introduction < ApplicationRecord
  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position

  validates :position_id, numericality: { other_than: 1 } 
end
