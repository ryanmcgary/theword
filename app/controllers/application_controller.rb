class ApplicationController < ActionController::Base
  protect_from_forgery :only => [:create, :update, :destroy] 
end
