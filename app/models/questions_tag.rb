class QuestionsTag
  
  include ActiveModel::Model
  attr_accessor :user_id, :title, :explanation, :genre_id, :name

  validates :title, presence: true
  validates :explanation, presence: true
  validates :user_id, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  delegate :persisted?, to: :question

  def initialize(attributes = nil, question: Question.new)
    @question = question
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      tags = split_tag_names.map { |name| Tag.find_or_create_by!(name: name) }
      question.update!(title: title, explanation: explanation, genre_id: genre_id, tags: tags)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def create
    question = Question.create(title: title, explanation: explanation, genre_id: genre_id, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    QuestionTag.create(question_id: question.id, tag_id: tag.id)
  end
  
  def to_model
    question
  end

  private

  attr_reader :question

  def default_attributes
    {
      title: question.title,
      explanation: question.explanation,
      genre_id: question.genre_id,
      name: question.tags.pluck(:name).join(',')
    }
  end

  def split_tag_names
    name.split(',')
  end

end