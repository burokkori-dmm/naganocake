class Public::CartItemsController < ApplicationController

  #before_action :setup_cart_item, only: [:update, :destroy]

  def index
    #カート内商品を表示させる
    #@cart_items = CartItem.where(user_id: current_user.id)
    @cart_items = current_user.cart_items.page(params[:page]).reverse_order
    #合計金額
    @total_price = 0

  end

  def create
       @cart_item = current_user.cart_items.find_or_initialize_by(sweet_id: params[:sweet_id])
       @cart_item.user_id = current_user.id
       @cart_item.save
       redirect_to public_cart_items_path
      # @cart_item = current_user.cart_items.find_by(sweet_id: params[:sweet_id])
      # @cart_item.blank?
      # @cart_item = CartItem.new(cart_item_params)
      # @cart_item.user_id = current_user.id
      # @cart_item.peace += params[:peace].to_i
      # @cart_item.save
      # redirect_to public_cart_items_path, notice: '商品をカートに追加しました！'
  end

  def update
    #数量変更時の変更
    cart_item = current_user.cart_items.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to public_cart_items_path, notice: '数量を変更しました！'
  end

  def destroy
    #一部変更(余裕があれば非同期)
    cart_item = current_user.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    #全て削除(余裕があれば非同期)
    @cart_items = current_user.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

private

  def cart_item_params
    params.require(:cart_item).permit(:sweet_id, :peace, :user_id)
  end

  # def setup_cart_item
  #   cart_item = current_user.cart_items.find(params[:id])
  # end

end
