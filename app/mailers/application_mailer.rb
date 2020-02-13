# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'nubianspirit@mail.com'
  layout 'mailer'
end
