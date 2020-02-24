class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :update, :edit, :destroy, :remove_song]


  def index
    @billboards = Billboard.all
  end

  def show
    @songs = @billboard.songs
  end

  def edit
    #before_action
  end

  def update
    #before_action
    if @billboard.update(billboard_params)
      redirect_to billboard_path(@billboard)
    else
      render :edit
    end
  end

  def new
    @billboard = Billboard.new
  end

  def new_song
    @billboard = Billboard.find(params[:id])
    @songs = Song.all.where(billboard_id: nil)
  end

  def add_song
    @billboard = Billboard.find(params[:id])
    @billboard.songs << Song.find(params[:song_id])
    redirect_to billboard_path(@billboard)
  end

  def remove_song
    #before_action
    Song.find(params[:song_id]).update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end

  def create
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      redirect_to billboards_path
    else
      render :new
    end
  end

  def destroy
    #before_action
    @billboard.destroy
    redirect_to billboards_path
  end

  private
  def set_billboard
    @billboard = Billboard.find(params[:id])
  end

  def billboard_params
    params.require(:billboard).permit(:name, :id, :song_id, :artist_id)
  end
end
