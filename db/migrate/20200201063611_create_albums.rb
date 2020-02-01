class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :title
      t.string :body
      t.string :photo_album

      t.timestamps
    end
  end
end
