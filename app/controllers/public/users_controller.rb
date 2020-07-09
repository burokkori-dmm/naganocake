class Public::UsersController < ApplicationController
	#before_action :ensure_corrent_user, {only: [:edit, :update]}

  def show
      @user = User.find(params[:id])
  end

  def hide
  	  @user = User.find(params[:id])
  	  @user.update(flag: true)
  	  reset_session
  	  flash[:notice] = "ありがとうございました。またのご利用をこころよりお待ちしております。"
  	  redirect_to root_path
  end

  def edit
  	  @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(@user.id)
      else
         render 'edit'
      end
  end

  def quit
      @user = User.find(params[:id])
  end

  private
  
  def user_params
  	  params.require(:user).permit(:lastname, :firstname, :sublastname, :subfirstname, :email, :password, :address, :postalcode, :phonenumber)
  end
  
  def ensure_corrent_user
  	  @user = User.find_by(id: params[:id])
  	  if @user.id != current_user.id
  	  	 redirect_to user_path(current_user.id)
  	  end
  end
end
