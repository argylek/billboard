class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:edit, :update]
  def index
    @songs = Song.all
  end

  def new
    @song = @artist.songs.new
    render partial: "form"
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to [@artist, @song]
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    render partial: "form"
  end

  def update
    if @artist.songs.update(song_params)
      redirect_to artist_song_path(@artist.id, @song.id)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end

  private
  def song_params
    params.require(:song).permit(:name, :billboard_id, :id)
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end


end
