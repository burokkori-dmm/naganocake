class Public::SweetsController < ApplicationController
  def index
  	@sweets = Sweet.all
  	@genres = Genre.all
  end

  def show
  	@sweet = Sweet.find(params[:id])
  	@genres = Genre.all
  	@cart_item = CartItem.new
  end

  # ↓adminでは必要でpublicでは不要？何故？ちなみにこれがあるとshowの表示の際にエラーが出る↓
  # private
  # def sweet_params
  	# 個数を入力するカラムをsweetテーブルに追加？
	  # params.require(:sweet).permit(:genre_id, :name, :tax_free_price, :detail, :image_id)
  # end

end
