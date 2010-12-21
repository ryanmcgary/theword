class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @words = @user.words
    @title = ("List of " + @user.name.pluralize + " Word".pluralize + " and Recordings".pluralize )    
    
    if params[:word] != nil then
      @recordings = @user.words.find(params[:word]).recordings
    else 
      @recordings = @user.recordings  
    end
    
    # if params word not nil render recording partial that displays audio
    
    rescue ActiveRecord::RecordNotFound
      render :partial => 'right_column'
           
  end
end
