# frozen_string_literal: true

class AgendaMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agenda_mailer.new_agenda.subject
  #
  def new_agenda(agenda)
    @agenda = agenda
    @user = User.all
    @user.each do |user|
      mail to: user.mail
    end
  end
end
