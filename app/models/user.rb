# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :set_downcase_email
  after_initialize :default_role
  validates :role, inclusion: { in: %w[registered admin] }
  validates :mail, presence: true,
                   uniqueness: true
  has_secure_password
  def set_downcase_email
    self.mail = mail.downcase
  end

  def default_role
    self.role ||= 'registered'
  end
end
