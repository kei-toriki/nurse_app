class QuestionsController < ApplicationController
  before_action :authenticate_user! , only: [:new ,:create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @questions = Question.includes(:user).order('created_at DESC')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
      if @question.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
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

  private
    def question_params
      params.require(:question).permit(:title, :explanation, :genre_id).merge(user_id: current_user.id)
    end

    def move_to_index
      @question = Question.find(params[:id])
      unless @question.user.id == current_user.id
      redirect_to action: :index
      end
    end

end
