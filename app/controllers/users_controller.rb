class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @words = @user.words
    @recordings = @user.recordings
    @title = ("List of " + @user.name.pluralize + " Word".pluralize + " and Recordings".pluralize )     
  end
end
