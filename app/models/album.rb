# frozen_string_literal: true

class Album < ApplicationRecord
  has_many :songs
  mount_uploader :photo_album, PhotoAlbumUploader
end
