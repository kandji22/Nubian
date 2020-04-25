# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]
  before_action :ensure_authenticated, only: %i[edit new create update destroy]
  before_action :ensure_admin?, only: %i[edit new create update destroy]
  def edit
    @songs = Song.all
    @song_album = @album.songs.build
  end

  def new
    @album = Album.new
    @songs = Song.all
    @song_album = @album.songs.build
   end

  def create
    @album = Album.new(album_params)
    params[:song][:id].each do |sound|
      unless sound.empty?
        sound_trouve = Song.find(sound)
        @album.songs << sound_trouve
      end
    end
    respond_to do |format|
      if @album.save
        AlbumMailer.new_album(@album).deliver_now
        format.html { redirect_to admin_showalbum_path(@album), notice: 'album was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)

        @album.songs.delete_all
        params[:song][:id].each do |sound|
          unless sound.empty?
            sound_trouve = Song.find(sound)
            @album.songs << sound_trouve
          end
        end

        format.html { redirect_to @album, notice: 'album was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @album.destroy!
    respond_to do |format|
      format.js
    end
end

  def index
    @album = Album.all.page(params[:page])
  end

  def show
    @songs = @album.songs
    @disable = current_user.wichlists.exists?(@album.id) if login?
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :title, :body, :photo_album)
  end
end
