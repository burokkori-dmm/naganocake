class Public::HomeController < ApplicationController
  def about
  end

  def top
  	@genres = Genre.all
  	@sweets = Sweet.page(params[:page]).per(3).reverse_order
  end
end
