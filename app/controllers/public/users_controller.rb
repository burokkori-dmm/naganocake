class Public::UsersController < ApplicationController
	#before_action :ensure_corrent_user, {only: [:edit, :update]}

  def show
      @user = current_user
  end

  def hide
  	  @user = current_user
  	  @user.update(flag: true)
  	  reset_session
  	  flash[:notice] = "ありがとうございました。またのご利用をこころよりお待ちしております。"
  	  redirect_to root_path
  end

  def edit
  	  @user = current_user
  end

  def update
      @user = current_user
      if @user.update(user_params)
         redirect_to public_user_path(@user.id)
      else
         render 'edit'
      end
  end

  def quit
      @user = current_user
  end

  private
  
  def user_params
  	  params.require(:user).permit(:last_name, 
                                    :first_name, 
                                    :sub_last_name, 
                                    :sub_first_name, 
                                    :email,  
                                    :address, 
                                    :postal_code, 
                                    :phone_number)
  end
  
  def ensure_corrent_user
  	  @user = User.find_by(id: params[:id])
  	  if @user.id != current_user.id
  	  	 redirect_to user_path(current_user.id)
  	  end
  end
end
