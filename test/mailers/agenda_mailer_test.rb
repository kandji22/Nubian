# frozen_string_literal: true

require 'test_helper'

class AgendaMailerTest < ActionMailer::TestCase
  test 'new_agenda' do
    mail = AgendaMailer.new_agenda
    assert_equal 'New agenda', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
