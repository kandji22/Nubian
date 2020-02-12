# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :set_downcase_email
  after_initialize :default_role
  has_many :comments
  has_and_belongs_to_many :wichlists, class_name: 'Album'
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
  mount_uploader :profil_img, ProfilImgUploader
end
