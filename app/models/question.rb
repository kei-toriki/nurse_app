class Question < ApplicationRecord
  validates :title, presence: true
  validates :explanation, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
