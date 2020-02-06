# frozen_string_literal: true

class Deleteuserreferences < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :references
  end
end
