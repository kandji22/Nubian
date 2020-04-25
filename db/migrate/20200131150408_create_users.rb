# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :role
      t.string :profil_img

      t.timestamps
    end
  end
end
