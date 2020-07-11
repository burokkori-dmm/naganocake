class Admin::OrdersController < ApplicationController

  def index
  	if params[:day]
      @orders = Order.created_today
    else
  	   @orders = Order.all
    end
  end

  def show
  	@order = Order.find(params[:id])
    @oreder_details = @order.oreder_details
  end

  def update
  	@order = Order.find(params[:id])
    @order.update(order_params)
  	redirect_back(fallback_location: root_path)
  end

  private
   def order_params
  	params.require(:order).permit(:order_status,order_details_attributes:[:id, :making_status])
  end
end
