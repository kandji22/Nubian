# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: user.mail, subject: 'Sign Up Confirmation'
  end

  def password_reset(user)
    @user = user
    mail to: user.mail, subject: 'password Reset'
  end
end
