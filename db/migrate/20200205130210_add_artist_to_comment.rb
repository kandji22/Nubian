# frozen_string_literal: true

class AddArtistToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :artist, foreign_key: true
  end
end
