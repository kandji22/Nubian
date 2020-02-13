# frozen_string_literal: true

class ChangeUrlInstagramToMail < ActiveRecord::Migration[5.1]
  def change
    rename_column :artists, :url_instagram, :mail
  end
end
