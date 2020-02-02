# frozen_string_literal: true

class SongsController < ApplicationController
  before_action :set_song, only: %i[show edit update destroy]
  def edit
    @artists = Artist.all
    @song_artist = @song.artists.build
  end

  def new
    @song = Song.new
    @artists = Artist.all
    @song_artist = @song.artists.build
   end

  def create
    @song = Song.new(song_params)
    params[:artist][:id].each do |artiste|
      unless artiste.empty?
        artiste_trouve = Artist.find(artiste)
        @song.artists << artiste_trouve
      end
    end
    respond_to do |format|
      if @song.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @song, notice: 'song was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @song.update(song_params)
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @song, notice: 'song was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :title, :audio_url, :video_url, :body)
  end
end
