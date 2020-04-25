# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/agenda_mailer
class AgendaMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/agenda_mailer/new_agenda
  def new_agenda
    AgendaMailer.new_agenda
  end
end
