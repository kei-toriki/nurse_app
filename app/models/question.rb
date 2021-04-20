class Question < ApplicationRecord

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_one :best, dependent: :destroy

  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
  

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
