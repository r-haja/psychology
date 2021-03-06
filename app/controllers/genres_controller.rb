class GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :genre_set, only: [:edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to genres_path
    else
      render :edit
    end
  end

  def destroy
    if @genre.destroy
      redirect_to genres_path
    else
      render :index
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name, :passport_id)
    end

    def genre_set
      @genre = Genre.find_by(id: params[:id])
    end
end
