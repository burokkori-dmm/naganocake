class Public::DeliverysController < ApplicationController

  def index
    #一覧表示(each),新規投稿(form_for)
    @delivery = Delivery.new
    @deliverys = Delivery.all
  end

  def create
    #新規投稿の追加
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
    redirect to public_deliveryies_path
    else
      render "index"
    end
  end

  def edit
    #編集ページ
    @delivery = Delivery.find(params[:id])

  end

  def update
    #編集ページの更新
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
       redirect to public_deliveries_path
    else
      render "edit"
    end
  end

  def destroy
    #情報削除
  end

private
  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name)
  end
end
