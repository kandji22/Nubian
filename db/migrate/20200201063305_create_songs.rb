class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :title
      t.string :audio_url
      t.string :video_url
      t.string :body

      t.timestamps
    end
  end
end
