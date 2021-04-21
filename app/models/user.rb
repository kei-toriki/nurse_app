class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :questions
  has_many :answers
  has_many :bests
  has_many :likes
  validates :nickname, presence: true

  def liked_by?(question_id)
    likes.where(question_id: question_id).exists?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position

  validates :position_id, numericality: { other_than: 1 } 

  
end
  
