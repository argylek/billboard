# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: %i[show destroy update edit]
  def index
    #before_action
    @songs = @artist.songs.all
  end

  def new
    @song = @artist.songs.new
    render partial: 'form'
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to artist_songs_path(@artist.id)
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
    if @song.update(song_params)
      redirect_to artist_song_path(@artist.id, @song.id)
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
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :body, :board_id, :artist.id, :artist.name)
  end


end
