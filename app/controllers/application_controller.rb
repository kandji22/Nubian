# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include RoleHelper
  before_action :set_local
  helper_method :login?
  helper_method :current_user
  helper_method :ensure_admin?
  helper_method :authorize_to_edit_user
  def set_local
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def login?
    session[:user_id].present?
  end

  def current_user
    @user = User.find(session[:user_id])
  end

  def ensure_admin?
    return if current_user.role == 'admin'

    redirect_to root_path
  end

  def ensure_authenticated
    if session[:user_id].present?
      nil
    else
      redirect_to new_session_path
  end
end

  def authorize_to_edit_user
    redirect_to root_path unless can_edit?(@user)
  end
end
