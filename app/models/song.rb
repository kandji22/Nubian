# frozen_string_literal: true

class Song < ApplicationRecord
  has_and_belongs_to_many :artists
  belongs_to :album
  mount_uploader :photo_song, PhotoSongUploader
end
