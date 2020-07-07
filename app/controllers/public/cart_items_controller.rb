class Public::CartItemsController < ApplicationController

  before_action :setup_cart_item!, only: [:create, :update, :destroy]

  def index
    #カート内商品を表示させる
    @cart_items =CartItem.all
    #current_public_user.cart_item(userやsweetを入れたら使える)
    @total_price = 0
    #合計価格

  end

  def create
    #もしカート商品に追加したい商品がなかったら新規追加する
  if @cart_items.blank?
    @cart_item = current_cart.cart_items.build(sweet_id: params[:sweet_id])
  end
    @cart_item.peace += params[:peace].to_i
    @cart_items.save
    redirect_to current_cart
  end

  def update
    #数量変更時の変更(select_tag)
    #パラムスでpeaceを持ってくる
    @cart_item.update(peace: params[:peace].to_i)
    redirect_to current_cart
  end

  def destroy
    #一部変更(余裕があれば非同期)
    @cart_item.destroy
    redirect_to current_cart
  end

  def destroy_all
    #全て削除(余裕があれば非同期)
    @cart_items = current_cart.cart_item.find_by(sweet_id: params[:sweet_id])
    @cart_items.destroy
    redirect_to current_cart
  end

  def serup_cart_item!
    @cart_item = current_cart.cart_item.find_by(sweet_id: params[:sweet_id])
  end
end
