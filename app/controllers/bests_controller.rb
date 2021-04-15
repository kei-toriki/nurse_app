class BestsController < ApplicationController
  def create
    # @answer = Answer.find(params[:question_id])
    # @question = Question.find(params[:answer_id])
    @best = Best.new(
      user_id: current_user.id, 
      question_id: params[:question_id],
      answer_id: params[:answer_id]
    )
    # @best = Best.new(best_params)
    if @best.save
      redirect_to "/questions/#{@best.question_id}"
    end
  end


  # def best_params
  #   params.require(:best).permit().merge(user_id: current_user.id, question_id: params[:question_id],answer_id: params[:answer_id])
  # end
end
