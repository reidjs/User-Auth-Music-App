class AlbumsController < ApplicationController
  def new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      render :show
    else
      flash.now[:error] = ["Error saving album"]
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def destroy
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end
