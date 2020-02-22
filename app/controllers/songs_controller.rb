# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: %i[show create destroy update edit]
  def index
    @songs = @artist.songs
  end

  def new
    @song = @artist.songs.new
    render partial: 'form'
  end

  def create
    @song = @artist.songs.new(songs_params)
    if @song.save
      redirect_to [@artist, @song]
    else
      render :new
    end
  end

  def show
    # before_action
  end

  def edit
    # before_action
    render partial: 'form'
  end

  def update
    # before_action
    if @song.update(songs_params)
      redirect_to artist_song_path(@artist, @song)
    else
      render :edit
    end
  end

  def destroy
    # before_action
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end

    private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:song_id])
  end

  def songs_params
    params.require(:song).permit(:name, :body)
  end
end
