class Admin::AdminsController < ApplicationController
  before_action :ensure_current_admin only: [:new, :create]
  before_action :if_not_admin
  def new
  	  @admin = Admin.new #管理ユーザーを作る
  	  @admin = current_admin
  	  @user = current_user
  	  @users = User.all
  end

  def create
      @newadmin = Admin.new #管理ユーザーを作る   
      @newadmin.admin_id = current_admin.id
      @admin = current_admin
      @admin.save
  end

  def index
      @admin = Admin.new
      @admin = Admin.find(params[:id])
      @usrs = User.alls
  end

  def show
      @admin = Admin.find(params[:id])
  end

  def edit
      @admin = Admin.find(params[:id])
  end

  def update
      @admin = Admin.find(params[:id])
  end

  private
  
  def admin_params
  	  params.require(:admin).permit(:email, :password)
  end
  
  def if_not_admin
      redirect_to root_path unless current_user.admin?
  end


end
