class QuestionsController < ApplicationController
  before_action :authenticate_user! , only: [:new ,:create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @questions = Question.includes(:user).order('created_at DESC')
  end

  def new
    @form = QuestionsTag.new
  end

  def create
    @form = QuestionsTag.new(question_params)
      if @form.create
        redirect_to root_path
      else
        render :new
      end
  end
   

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.includes(:user)
  end

  def edit
    @question = current_user.questions.find(params[:id])
    @form = QuestionsTag.new(question: @question)
  end

  def update
    @question = current_user.questions.find(params[:id])
    @form = QuestionsTag.new(question_params, question: @question)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render :edit
    end
  end


  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def search
    @questions = Question.search(params[:keyword])
    render :index
  end

  private
    def question_params
      params.require(:question).permit(:title, :explanation, :genre_id, :name).merge(user_id: current_user.id)
    end
      

    def move_to_index
      @question = Question.find(params[:id])
      unless @question.user.id == current_user.id
      redirect_to action: :index
      end
    end
end

