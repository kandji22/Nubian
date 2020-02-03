# frozen_string_literal: true

class AdminController < ApplicationController
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
end
