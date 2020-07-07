class Public::SweetsController < ApplicationController
  def index
  	@sweets = Sweet.all
  end

  def show
  	@sweet = Sweet.find(params[:id])
  end

  # ↓adminでは必要でpublicでは不要？何故？ちなみにこれがあるとshowの表示の際にエラーが出る↓
  # private
  # def sweet_params
  # 	個数を入力するカラムをsweetテーブルに追加？
  #     params.require(:sweet).permit(:genre_id, :name, :tax_free_price, :detail, :image_id)
  # end

end
