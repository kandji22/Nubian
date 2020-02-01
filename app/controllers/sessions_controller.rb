# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(mail: params[:mail].downcase)
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = 'password or email failed'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
   end
end
