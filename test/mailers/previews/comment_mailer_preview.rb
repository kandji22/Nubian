# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/new_comment
  def new_comment
    comment = Comment.find 1
    CommentMailer.new_comment(comment)
  end
end
