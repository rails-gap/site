class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, notice: 'Please sign in with your GAP account.'
    end
  end

  def admin_access?
    access_error unless valid_admin?
  end

  def practice_lead_access?
    access_error unless valid_practice_lead?
  end

  def content_admin_access?
    access_error unless valid_content_admin?
  end

  def access_error
    redirect_to root_path, alert: 'Access denied.'
  end

  def valid_admin?
    current_user.admin?
  end

  def valid_practice_lead?
    valid_admin? || current_user.practice_lead?
  end

  def valid_content_admin?
    valid_practice_lead? || current_user.content_admin?
  end

end
