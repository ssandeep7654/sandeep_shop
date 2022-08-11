class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_user_types

  def layout_by_user_types
    if current_user.present?
      "layouts/application"
    else
      "layouts/login/application"
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, address_attributes: [:country, :state, :city, :area, :postal_code]])
  end
end
