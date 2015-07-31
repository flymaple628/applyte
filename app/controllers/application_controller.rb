class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


protected

  def layout_by_resource
    if devise_controller?
      "sign_page"
    else
      "application"
    end
  end

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:email, :username, :password, :password_confirmation, :first_name, :middle_name, :last_name, :prefered_name, :sex, :birthday, :phone)}
    devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:email, :username, :password, :password_confirmation, :first_name, :middle_name, :last_name, :prefered_name, :sex, :birthday, :phone)}

  end
end
