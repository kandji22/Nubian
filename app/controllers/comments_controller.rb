# frozen_string_literal: true

class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_artist
  before_action :login?
  def create
    @comment = Comment.new(comment_params)
    @comment.artist = @artist

    # Needs to be changed: this always sets the User for a Comment to the first
    # User in the database, _not_ the User that POSTed the Comment.
    @comment.user = current_user

    respond_to do |format|
      # In these format calls, the flash message is being passed directly to
      # redirect_to().  It's a caonvenient way of setting a flash notice or
      # alert without referencing the flash Hash explicitly.
      if @comment.save
        CommentMailer.new_comment(@comment).deliver_now
        format.html { redirect_to @artist }
        format.js
      else
        format.html { redirect_to @artist }
      end
    end
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @artist }
      format.js
    end
end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
