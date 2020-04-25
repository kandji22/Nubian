# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :artist
  belongs_to :user
  validates :body, length: { maximum: 200 }
end
