<<<<<<< HEAD
class ArtistsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end
end
=======
# frozen_string_literal: true

class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to artist_path
    else
      render :edit
    end
  end

  def edit

  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name)
  end
end
>>>>>>> 776033754655399c85a3893f2f6f6582761653ff
