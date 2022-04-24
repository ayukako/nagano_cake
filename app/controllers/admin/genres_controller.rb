class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    genre = Genre.new(genre_params)
    genre.save
    redirect_to 'adamin/genres/index'
  end

  def create
  end

  def edit
  end

  def update
  end

  def genre_params
    params.permit(:name)
  end

end
