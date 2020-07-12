class Admin::AdminsController < ApplicationController
  before_action :ensure_current_admin only: [:new, :create]
  before_action :if_not_admin
  def index
      @admin = current_admin
      @users = User.all
  end

  def show
      @admin = current_admin
      @user = current_user(params[:id])
  end

  def edit
      @admin = current_admin
      @user = current_user(params[:id])
  end

  def update
      @admin = currnt_admin
      if @admin.update
         redirect_to edit_admin_user_path
      else
         render 'show'
      end
  end

  private
  
  def admin_params
      params.require(:admin).permit(:email, :password)
  end
  
  def if_not_admin
      redirect_to root_path unless current_user.admin?
  end


end
