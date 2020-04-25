# frozen_string_literal: true

class AddAuthTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :auth_token, :string
  end
end
