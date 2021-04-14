class BestsController < ApplicationController
  def create
    @best = Best.new(
      user_id: current_user.id, 
      question_id: params[:question_id],
      answer_id: params[:answer_id]
    )
    # binding.pry
    # @best = Best.new(best_params)
    @best.save
    redirect_to root_path
  end


  # def best_params
  #   params.require(:best).permit().merge(user_id: current_user.id, question_id: params[:question_id],answer_id: params[:answer_id])
  # end
end
