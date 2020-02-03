# frozen_string_literal: true

class Artist < ApplicationRecord
  has_and_belongs_to_many :songs
  mount_uploader :photo_artist, PhotoArtistUploader
end
