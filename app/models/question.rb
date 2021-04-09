class Question < ApplicationRecord
  validates :title, presence: true
  validates :explanation, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  belongs_to :user
  has_many :answers
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
