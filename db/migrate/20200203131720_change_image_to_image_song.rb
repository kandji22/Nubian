# frozen_string_literal: true

class ChangeImageToImageSong < ActiveRecord::Migration[5.1]
  def change
    rename_column :songs, :image, :photo_song
  end
end
