class ApplicationController < ActionController::Base
	private
	def current_cart
		#セッションから取得したcart_idを元にCart_itemテーブルから情報取得
		current_cart = Cart_item.find_by(id: session[:cart_id])
		#Cart_itemテーブルに情報が存在しない(unless)場合、@current_cartを作成
		current_cart = Cart_item.create unless current_cart
		#取得したCart_Item情報をsessionに設定
		session[:cart_id] = current_cart.id
		#Cart_item情報を返却
		current_cart
    end
end
