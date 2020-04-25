# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  def new; end

  def create
    user = User.find_by(mail: params[:mail])
    user.send_password_reset
    redirect_to root_path, notice: 'Email sent with password reset'
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:password_resets])
  end

  def update
    @user = User.find_by_id!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: 'Password reset has expired'
    elsif @user.update(user_params)
      redirect_to new_session_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :profil_img, :password)
  end
end
