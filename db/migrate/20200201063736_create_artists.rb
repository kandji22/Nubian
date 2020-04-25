# frozen_string_literal: true

class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :photo
      t.string :bibliographie
      t.string :url_facebook
      t.string :url_instagram

      t.timestamps
    end
  end
end
