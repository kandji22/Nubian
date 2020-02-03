# frozen_string_literal: true

class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update destroy]

  def new
    @artist = Artist.new
   end

  def create
    @artist = Artist.new(artist_params)
    respond_to do |format|
      if @artist.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @artist.update(artist_params)
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
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

  def show; end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :photo, :bibliographie, :url_facebook, :url_instagram)
  end
end
