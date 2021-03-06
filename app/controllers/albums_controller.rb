class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new(band_id: params[:band_id])

    render :new
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = ["FAILED TO UPDATE"]
      render :edit
    end
  end

  def create
    @album = Album.new(album_params)
 
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = ["FAILED TO CREATE ALBUM"]
      render :new
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band_id)
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end