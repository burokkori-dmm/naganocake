class Public::OrdersController < ApplicationController

  def new
  	@user = current_user
  	if @user.cart_items.blank?
  		redirect_to public_cart_items_path
  	else
  	@order = Order.new(user_id: @user.id)
  	@addres = @user.deliveries
  	@deliverys = Delivery.new(user_id: @user.id)
    end
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
				@order.name = @user.last_name + @user.first_name
				@order.postal_code = @user.postal_code
				@order.order_status = 0
			elsif params[:_add] == "deliveryAdds"
				@ad = @addres.find(params[:Delivery][:id])
				@order.address = @ad.address
				@order.name = @ad.name
				@order.postal_code = @ad.postal_code
				@order.order_status = 0
			elsif params[:_add] == "newAdd"
				@ad = Delivery.new
				@ad.user_id = @user.id
				@ad.address = params[:deliveries][:address]
				@ad.name = params[:deliveries][:name]
				@ad.postal_code = params[:deliveries][:postal_code]
				@ad.save

				@order.address = params[:deliveries][:address]
				@order.name = params[:deliveries][:name]
				@order.postal_code = params[:deliveries][:postal_code]
				@order.order_status = 0
			end
			current_user.cart_items.each do |i|
				 @oreder_details = OrederDetail.new(sweet_id: i.sweet_id, tax_price: (i.sweet.tax_free_price*i.peace), peace: i.peace, making_status: 1, order_id: @order.id)
				 @oreder_details.save!
				end


		if @order.save
			redirect_to confirm_public_order_path(@order)
		else
			render :new
		end
  end

  def success
	current_user.cart_items.destroy_all
  end

  def index
  	@user = current_user
  	@orders = @user.orders
  	unless current_user.nil? || current_user.id == @user.id
			redirect_to orders_path(id: current_user.id)
		end
  end

  def confirm
  	@order = Order.find(params[:id])
  	unless current_user.nil? || current_user.id == @order.user_id
			redirect_to orders_path(id: current_user.id)
		end
		@items = @order.oreder_details
  end

   private

   def order_params
	 	params.require(:order).permit(
	 		:user_id, :payment_method, :address, :postal_code, :name, :order_status, :postage,
	 		deliveries:[:postal_code, :address, :name]
	 		)
	 end

    def item_params
      params.require(:cart_item).permit(:user, :sweet, :quantity, :price)
    end

end