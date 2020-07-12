class Admin::SweetsController < ApplicationController

  # 管理者が見る商品一覧画面
  def index
    @sweets = Sweet.all

  end

  # 管理者が商品を新規登録する画面
  def new
    @sweet = Sweet.new
    @genres = Genre.all
  end

  # 管理者が商品を新規登録する（viewなし）
  def create
    sweet = Sweet.new(sweet_params)
    sweet.save
    redirect_to admin_sweet_path(sweet.id)
  end

# 管理者が見る商品の詳細画面
  def show
    @sweet = Sweet.find(params[:id])
  end

# 管理者が商品情報を編集する画面
  def edit
    @sweet = Sweet.find(params[:id])
    @genres = Genre.all
  end

# 管理者が商品情報を更新する（viewなし）
  def update
    sweet = Sweet.find(params[:id])
    sweet.update(sweet_params)
    redirect_to admin_sweets_path
  end

  private
  def sweet_params
      params.require(:sweet).permit(:genre_id, :name, :tax_free_price, :detail, :image, :sale_status)
  end

end
