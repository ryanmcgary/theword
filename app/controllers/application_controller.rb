class ApplicationController < ActionController::Base
  protect_from_forgery :only => [:destroy]
  layout :layout_by_resource
    
    def layout_by_resource
      if devise_controller?
        "application_devise"
      elsif params[:layout] == "embed_light"
        "application_embed_light"   
      elsif params[:layout] == "embed_dark"
        "application_embed_dark"    
      else 
        "application"
      end
    end
   
end
