# frozen_string_literal: true

class AddImageToSong < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :image, :string
  end
end
