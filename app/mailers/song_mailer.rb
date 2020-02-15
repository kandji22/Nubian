# frozen_string_literal: true

class SongMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.song_mailer.new_song.subject
  #
  def new_song(song)
    @song = song
    @user = User.all
    @user.each do |user|
      mail to: user.mail
    end
  end
end
