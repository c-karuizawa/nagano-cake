class Admin::GenresController < ApplicationController
  before_action :authenticate_admin_admin!
  
  def index
    @genre=Genre.new
    @genres=Genre.all
  end

  def create
    @genre=Genre.new(genre_params)
    if @genre.save
    redirect_to request.referer,notice:"登録完了しました！"
    else
    render :index
    end
  end

  def edit
    @genre=Genre.find(params[:id])
  end

  def update
    @genre=Genre.find(params[:id])
    if @genre.update(genre_params)
    redirect_to admin_genres_path,notice:"更新完了しました！"
    else
    reder :edit
    end
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
