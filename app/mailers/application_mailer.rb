# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'nubianspirit@gmail.com'
  layout 'mailer'
end
