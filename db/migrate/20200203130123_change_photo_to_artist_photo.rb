# frozen_string_literal: true

class ChangePhotoToArtistPhoto < ActiveRecord::Migration[5.1]
  def change
    rename_column :artists, :photo, :photo_artist
  end
end
