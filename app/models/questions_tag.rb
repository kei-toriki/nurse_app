class QuestionsTag
  
  include ActiveModel::Model
  attr_accessor :user_id, :title, :explanation, :genre_id, :name

  validates :title, presence: true
  validates :explanation, presence: true
  validates :user_id, presence: true
  validates :genre_id, numericality: { other_than: 1 } 


  def save
    question = Question.create(title: title, explanation: explanation, genre_id: genre_id, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    QuestionTag.create(question_id: question.id, tag_id: tag.id)
  end
  
end