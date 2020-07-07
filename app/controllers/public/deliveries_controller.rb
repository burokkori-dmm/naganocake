class Public::DeliveriesController < ApplicationController

before_action :setup_delivery, only: [:edit, :update, :destroy]

  def index
    #一覧表示(each),新規投稿(form_for)
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    #新規投稿の追加
    @delivery = Delivery.new(delivery_params)
    @delivery.user_id = user.id
    @delivery.save
    redirect_to public_deliveries_path
  end

  def edit
    #編集ページ(setup_deliveries使用)
  end

  def update
    #編集更新(setup_deliveries使用)
    if @delivery.update(delivery_params)
    redirect_to public_deliveries_path
    else
    render "edit"
    end
  end

  def destroy
    #情報削除(setup_deliveries使用)
    @delivery.destroy
    redirect_to public_deliveries_path
  end

private
  def delivery_params
    params.require(:delivery).permit(:postal_cade, :address, :name, :user_id)
  end

  def setup_delivery
    @delivery = Delivery.find(params[:id])
  end


end
