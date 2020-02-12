# frozen_string_literal: true

class WichlistsController < ApplicationController
  before_action :ensure_authenticated
  def create
    @album = Album.find(params[:album_id])
    current_user.wichlists << @album
    respond_to do |format|
      format.html { redirect_to album_path(@album) }
      format.js
    end
  end

  def destroy
    @wichlist = current_user.wichlists.find(params[:id])
    current_user.wichlists.destroy params[:id]
    respond_to do |format|
      # In this format call, the flash message is being passed directly to
      # redirect_to().  It's a caonvenient way of setting a flash notice or
      # alert without referencing the flash Hash explicitly.
      format.html { redirect_to user_wichlists_path(current_user) }
      format.js
    end
  end

  def index
    @wichlists = current_user.wichlists
  end
end
