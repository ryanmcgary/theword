class ApplicationController < ActionController::Base
  protect_from_forgery :only => [:destroy] 
end
