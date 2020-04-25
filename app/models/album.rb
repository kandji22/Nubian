# frozen_string_literal: true

class Album < ApplicationRecord
  has_many :songs
  has_and_belongs_to_many :Users
  mount_uploader :photo_album, PhotoAlbumUploader
  paginates_per 18
end
