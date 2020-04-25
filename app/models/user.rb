# frozen_string_literal: true

class User < ApplicationRecord
  before_validation :set_downcase_email
  after_initialize :default_role
  before_create { generate_token(:auth_token) }
  has_many :comments
  has_and_belongs_to_many :wichlists, class_name: 'Album'
  validates :role, inclusion: { in: %w[registered admin] }
  validates :mail, presence: true,
                   uniqueness: true
  has_secure_password
  def set_downcase_email
    self.mail = mail.downcase
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end
    while User.exists?(column => self[column])
  end
  end

  def default_role
    self.role ||= 'registered'
  end
  mount_uploader :profil_img, ProfilImgUploader
end
