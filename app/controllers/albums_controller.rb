class AlbumsController < ApplicationController

  attr_reader :album
  before_action :current_album

  def new
    render :new
  end

  def current_album
    return nil unless params[:id]
    @album ||= Album.find_by(id: params[:id])
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      render :show
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    # @album = Album.find_by(id: params[:id])
    render :edit
  end

  def destroy
    album = current_album
    album.destroy if album
    redirect_to band_url(album.band)

  end

  def show
    # @album = Album.find_by(id: params[:id])
    render :show
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end
