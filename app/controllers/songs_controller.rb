require 'pry'

class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to @song
    else
     # flash[:errors] = @song.errors.full_messages
     # redirect_to new_song_path
     render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    if @song.valid?
      redirect_to @song
    else
      # flash[:errors] = @song.errors.full_messages
      # redirect_to edit_song_path(@song)
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.delete
    redirect_to songs_path
  end

private

def song_params
    params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
  end

end
