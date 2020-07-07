class ApplicationController < ActionController::Base

	private
	def current_cart
	  if session[:user_id]
	  	@user = User.find(session[:user_id])
	  else
	  	@user = User.create
	  	session[:user_id] = @user.id
	  end
    end
end
