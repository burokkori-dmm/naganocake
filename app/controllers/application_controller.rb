class ApplicationController < ActionController::Base
	#before_action :authenticate_user!, except: [:top, :about]
	#before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :null_session
end
