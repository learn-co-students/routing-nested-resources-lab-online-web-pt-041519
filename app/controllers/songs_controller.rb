class SongsController < ApplicationController

  before_action :get_song, only: [:edit, :update, :destroy]

  def index
    if params[:artist_id]
      if Artist.find_by(id: params[:artist_id])
        @songs = Artist.find_by(id: params[:artist_id]).songs
      else
        flash[:notice] = "Artist not found."
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
  end

  def show
    if Song.find_by(id: params[:id])
      @song = Song.find(params[:id])
    else
      flash[:alert] = "Song not found."
      redirect_to artist_songs_path
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end

  def get_song
    @song = Song.find(params[:id])
  end

end

