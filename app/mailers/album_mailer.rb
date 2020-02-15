# frozen_string_literal: true

class AlbumMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.album_mailer.new_album.subject
  #
  def new_album(album)
    @album = album
    @user = User.all
    @user.each do |user|
      mail to: user.mail
    end
  end
end
