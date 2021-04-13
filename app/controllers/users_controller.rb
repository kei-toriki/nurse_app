class UsersController < ApplicationController
  @user = User.find(params[:id])
  @questions = @user.questions
  @answers = @user.answers
end
