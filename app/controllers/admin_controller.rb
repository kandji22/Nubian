# frozen_string_literal: true

class AdminController < ApplicationController
  def artists
    @artists = Artist.all
  end
end
