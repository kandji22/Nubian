# frozen_string_literal: true

class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update destroy]
  before_action :ensure_authenticated, only: %i[edit new create update destroy]
  before_action :ensure_admin?, only: %i[edit new create update destroy]
  def edit
    @songs = Song.all
    @artist_songs = @artist.songs.build
  end

  def new
    @artist = Artist.new
    @songs = Song.all
    @artist_songs = @artist.songs.build
   end

  def create
    @artist = Artist.new(artist_params)

    params[:song][:id].each do |sound|
      unless sound.empty?
        sound_trouve = Song.find(sound)
        @artist.songs << sound_trouve
      end
    end

    respond_to do |format|
      if @artist.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to admin_showartist_path(@artist), notice: 'Artist was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @artist.update(artist_params)
        @artist.songs.delete_all
        params[:song][:id].each do |sound|
          unless sound.empty?
            sound_trouve = Song.find(sound)
            @artist.songs << sound_trouve
          end
        end

        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @artist.destroy!
    respond_to do |format|
      format.js
    end
end

  def show
    @songs = @artist.songs
   end

  def index
    @artists = Artist.all
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :photo_artist, :bibliographie, :url_facebook, :url_instagram)
  end
end
