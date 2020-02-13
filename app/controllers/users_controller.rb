# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :ensure_authenticated, only: %i[edit update destroy]
  before_action :authorize_to_edit_user, only: %i[edit update destroy]

  def new
    @user = User.new
   end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to admin_showuser_path(@user), notice: 'User was successfully created.'
    else
      render :new

  end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy!
    respond_to do |format|
      format.js
    end
end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :mail, :profil_img, :password)
  end
end
