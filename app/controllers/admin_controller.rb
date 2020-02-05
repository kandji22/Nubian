# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :ensure_authenticated
  before_action :ensure_admin?
  def artists
    @artists = Artist.all
  end

  def users
    @users = User.all
  end

  def sounds
    @songs = Song.all
  end

  def albums
    @albums = Album.all
  end

  def agendas
    @agendas = Agenda.all
  end

  def showalbum
    @album = Album.find(params[:ie])
  end

  def showartist
    @artist = Artist.find(params[:ie])
  end

  def showsong
    @song = Song.find(params[:ie])
  end

  def showuser
    @user = User.find(params[:ie])
  end
end
