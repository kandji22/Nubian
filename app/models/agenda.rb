# frozen_string_literal: true

class Agenda < ApplicationRecord
  scope :most_recent, -> { order(date: :ASC) }
end
