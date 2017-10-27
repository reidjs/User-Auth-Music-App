class BandsController < ApplicationController
  def index
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to @band
    else
      flash.now[:error] = ["band save failed"]
      render :new
    end
  end

  def new
    render :new
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    @band = Band.find_by(id: params[:id])
    return nil if @band.nil?
    if @band.update(band_params)
      render :show
      return
    else
      flash.now[:errors] = ["band failed to update"]
      render :edit
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])
    if !band.nil?
      band.destroy
    else
      flash.now[:error] = ["no band selected to destroy"]
      render :index
      return
    end
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
