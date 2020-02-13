# frozen_string_literal: true

class CommentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.new_comment.subject
  #
  def new_comment(comment)
    @comment = comment
    @artist = @comment.artist
    mail to: @artist.mail,
         subject: 'New Comment on your profil '
  end
end
