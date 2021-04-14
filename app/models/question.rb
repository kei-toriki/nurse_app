class Question < ApplicationRecord
  validates :title, presence: true
  validates :explanation, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_one :best, dependent: :destroy

  def self.search(search)
    if search != ""
      Question.where('title LIKE(?) OR explanation LIKE(?)' , "%#{search}%", "%#{search}%" )
    else
      Question.includes(:user)
    end
  end

  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
