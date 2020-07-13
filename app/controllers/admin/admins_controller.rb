class Admin::AdminsController < ApplicationController
  #before_action :ensure_current_admin only: [:new, :create]
  #before_action :if_not_admin
  def index
      @admin = current_admin
      @users = User.all
  end

  def show
      @admin = current_admin
      @user = User.find(params[:id])
  end

  def edit
      @admin = current_admin
      @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to admin_admin_path(@user)
      else
         render 'edit'
      end
  end

  private
  
  def user_params
      params.require(:user).permit(:last_name, 
                                    :first_name, 
                                    :sub_last_name, 
                                    :sub_first_name, 
                                    :email, 
                                    :password, 
                                    :address, 
                                    :postal_code, 
                                    :phone_number)
  end
  
  def if_not_admin
      redirect_to root_path unless current_user.admin?
  end


end
