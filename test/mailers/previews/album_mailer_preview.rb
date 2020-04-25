# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/album_mailer
class AlbumMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/album_mailer/new_album
  def new_album
    AlbumMailer.new_album
  end
end
