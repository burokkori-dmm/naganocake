class Public::SweetsController < ApplicationController
  def index
    @sweets = Sweet.all
  	@sweets2 = Sweet.page(params[:page]).per(8).reverse_order
  	@genres = Genre.all
  end

  def show
  	@sweet = Sweet.find(params[:id])
  	@genres = Genre.all
  	@cart_item = CartItem.new
  end


  def search
    @sweets = Sweet.page(params[:page]).per(10).reverse_order
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end
  # @genre = Genre.find_by(id: params[:id])一個目のidと二個目のidについての認識　例：俺のタルト



  # ↓adminでは必要でpublicでは不要？何故？ちなみにこれがあるとshowの表示の際にエラーが出る↓
  # private
  # def sweet_params
  	# 個数を入力するカラムをsweetテーブルに追加？
	  # params.require(:sweet).permit(:genre_id, :name, :tax_free_price, :detail, :image_id)
  # end

end
