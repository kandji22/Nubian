# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(mail: params[:mail].downcase)
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end

      if current_user.role == 'admin'
        redirect_to admin_artists_path
      else
        redirect_to root_path
end
    else
      flash[:alert] = 'password or email failed'
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    session.delete(:user_id)
    redirect_to root_path
   end
end
