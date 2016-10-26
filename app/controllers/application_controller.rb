class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    redirect_to new_session_path, notice: "Please sign in" unless admin_signed_in?
  end

  def admin_signed_in?
    current_admin.present?
  end

  helper_method :admin_signed_in?

  def current_admin
    @current_admin ||= Admin.find_by_id session[:admin_id]
  end

  helper_method :current_admin
  
end
