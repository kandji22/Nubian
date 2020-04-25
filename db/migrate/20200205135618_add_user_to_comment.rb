# frozen_string_literal: true

class AddUserToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :user, foreign_key: true
  end
end
