class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :owner, :email, :password, :password_confirmation) }
  end

  protected

  def after_sign_in_path_for(resource)
    if current_user.owner
      analytics_path(current_user)
    else
      root_path
    end
  end
end
