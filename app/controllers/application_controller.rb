class ApplicationController < ActionController::Base
	#before_action :authenticate_user!, except: [:top, :about]
	#before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    
    #def after_sign_in_path_for(resource)
        #byebug
    	#stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
        #public_sweets_path(current_user.id)#ログイン後商品一覧ページを指定
    #end

    #def after_sign_up_path_for(resource)
    	#byebug
        #public_sweets_path(current_user.id)
    #end 

end
