class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
    # redirect_to_dashboard 
     blogs_path
  end
end
