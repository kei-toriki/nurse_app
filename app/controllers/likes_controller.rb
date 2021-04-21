class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, question_id: params[:question_id])
    redirect_to "/questions/#{@like.question_id}"
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, question_id: params[:question_id])
    @like.destroy
    redirect_to "/questions/#{@like.question_id}"
  end
end
