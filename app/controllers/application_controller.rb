class ApplicationController < ActionController::Base
  protect_from_forgery :only => [:destroy]
  layout :layout_by_resource
    
    def layout_by_resource
      if devise_controller?
        "application_devise"
      elsif params[:layout] == "embed"
        "application_embed"       
      else 
        "application"
      end
    end
   
end
