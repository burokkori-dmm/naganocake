class Public::OrdersController < ApplicationController

  def new
  	@user = current_user
  	@order = Order.new(user_id: @user.id)
  	@addres = @user.deliveries
  	@deliverys = Delivery.new(user_id: @user.id)
  end

  def show
  	@order = Order.find(params[:id])
  	unless current_user.nil? || current_user.id == @order.user_id
			redirect_to orders_path(id: current_user.id)
		end
  end


  def create
  	@order = Order.new(order_params)
  	@user = current_user
  	@addres = @user.deliveries
  	        if params[:_add] == "usersAdd"
				@order.address = @user.address
				@order.name = @user.select('last_name','first_name')
				@order.postal_code = @user.postal_code
			elsif params[:_add] == "deliveryAdds"
				@ad = @addres.find(params[:Delivery][:id])
				@order.address = @ad.address
				@order.name = @ad.name
				@order.postal_code = @ad.postal_code
			elsif params[:_add] == "newAdd"
				@ad = Delivery.new
				@ad.user_id = @user.id
				@ad.address = params[:deliveries][:address]
				@ad.name = params[:deliveries][:name]
				@ad.postal_code = params[:deliveries][:postal_code]
				@ad.save

				@order.ship_address = params[:deliveries][:address]
				@order.name = params[:deliveries][:last_name]
				@order.ship_postal_code = params[:deliveries][:postal_code]
			end


			item = []
			@items = @user.cart_items
				@items.each do |i|
					item << @order.order_details.build(sweet_id: i.sweet_id, price: i.price, peace: i.peace, making_status: 1)
				end
			OrderDetail.import item
		if @order.save
			redirect_to confirm_order_path(@order)
		else
			render :new
		end
  end

  def success
  	cart_items = current_user.cart_items
	cart_items.destroy_all
  end

  def index
  	@user = current_user
  	@orders = @user.orders
  	unless current_user.nil? || current_user.id == @user.id
			redirect_to orders_path(id: current_user.id)
		end
  end

  def confirm
  	@order = Order.new(order_params)
  	unless current_user.nil? || current_user.id == @order.user_id
			redirect_to orders_path(id: current_user.id)
		end
		@items = @order.order_details
  end

   private
    def item_params
      params.require(:cart_item).permit(:user, :sweet, :quantity, :price)
    end

end