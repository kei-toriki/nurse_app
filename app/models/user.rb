class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :questions
  has_many :answers
  # has_one :introduction
  validates :nickname, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position

  validates :position_id, numericality: { other_than: 1 } 
  
end
  
