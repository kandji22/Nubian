# frozen_string_literal: true

class Deletereference < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :references
  end
end
