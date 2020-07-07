class Public::OrdersController < ApplicationController
	before_action :authenticate!
	before_action :params_check, only: [:index]

  def new
  	@user =current_user
  	@order = Order.new(user_id: @user.id)
  	@addres = @user.deliverys
  	@deliverys = Deliverys.new(user_id: @user.id)
  	if @user.cart_items.blank?
  		redirect_to cart_items_path
  	else
  end

  def show
  	@order = Order.find(params[:id])
  end

  def create
  	@order = Order.new(order_params)
  	@user = current_user
  	@addres = @user.deliverys
  	        if params[:_add] == "usersAdd"
				@order.address = @user.address
				@order.name = @user.last_name.@user.first_name
				@order.postal_code = @user.postal_code
			elsif params[:_add] == "shipAdds"
				@ad = @ads.find(params[:ShipToAddress][:id])
				@order.address = @ad.address
				@order.last_name = @ad.last_name
				@order.first_name = @ad.first_name
				@order.postal_code = @ad.postal_code
			elsif params[:_add] == "newAdd"
				@ad = Deliverys.new
				@ad.user_id = @user.id
				@ad.address = params[:ship_to_address][:address]
				@ad.last_name = params[:ship_to_address][:last_name]
				@ad.first_name = params[:ship_to_address][:first_name]
				@ad.last_name_kana = params[:ship_to_address][:last_name_kana]
				@ad.first_name_kana = params[:ship_to_address][:first_name_kana]
				@ad.postal_code = params[:ship_to_address][:postal_code]
				@ad.phone = params[:ship_to_address][:phone]
				@ad.save

				@order.ship_address = params[:ship_to_address][:address]
				@order.last_name = params[:ship_to_address][:last_name]
				@order.first_name = params[:ship_to_address][:first_name]
				@order.last_name_kana = params[:ship_to_address][:last_name_kana]
				@order.first_name_kana = params[:ship_to_address][:first_name_kana]
				@order.ship_postal_code = params[:ship_to_address][:postal_code]
			end


			item = []
			@items = @user.cart_items
				@items.each do |i|
					item << @order.ordered_items.build(product_id: i.product_id, price: i.price, quantity: i.quantity, product_status: 1)
				end
			OrderedItem.import item
		if @order.save
			redirect_to confirm_order_path(@order)
		else
			render :new
		end
  end

  def success
  end

  def index
  	@user = User.find(params[:id])
  	@orders = @user.orders
  end

  def confirm
  	@order = Order.new(order_params)
  end

   private
    def item_params
      params.require(:cart_item).permit(:user_id, :product_id, :quantity, :price)
    end

    def user_is_deleted
      if user_signed_in? && current_user.is_deleted?
         redirect_to root_path
      end
    end
end