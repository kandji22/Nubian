# frozen_string_literal: true

class Album < ApplicationRecord
  has_many :songs
end
