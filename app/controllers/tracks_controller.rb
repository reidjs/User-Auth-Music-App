class TracksController < ApplicationController
  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def create
    @track = Track.new(track_params)
    # fail
    if @track.save
      render :show
    else
      debugger
      flash.now[:error] = ["wrong track params"]
      render :new
    end
  end

  def new
    render :new
  end

  def edit
  end

  def destroy
  end

  private

  def track_params
    params.require(:track).permit(:title, :ord, :bonus, :album_id)
  end
end
