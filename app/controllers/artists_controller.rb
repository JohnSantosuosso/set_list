class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new

  end

  def create
    artist = Artist.create(artist_params)  #we don't use instance variables when possible if we don't want to pass to view
    redirect_to "/artists"
  end

  def edit
    @artist = Artist.find(params[:id]) #we use instance variables when we want to pass to View
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to '/artists'
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to '/artists'
  end

private
  def artist_params
    params.permit(:name)
  end

end