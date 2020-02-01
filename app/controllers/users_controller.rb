# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
   end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :mail, :profil_img, :password)
  end
end
