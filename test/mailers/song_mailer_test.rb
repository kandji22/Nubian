require 'test_helper'

class SongMailerTest < ActionMailer::TestCase
  test "new_song" do
    mail = SongMailer.new_song
    assert_equal "New song", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
