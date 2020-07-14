class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
    @genres = Genre.all
      if @genre.save
         redirect_to admin_genres_path
      else
         render :index
      end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	@genre.update(genre_params)
  	@genres = Genre.all
  	redirect_to admin_genres_path
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :genre_status)
  end
end
