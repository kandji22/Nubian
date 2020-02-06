# frozen_string_literal: true

class Artist < ApplicationRecord
  has_and_belongs_to_many :songs
  has_many :comments
  mount_uploader :photo_artist, PhotoArtistUploader
end
