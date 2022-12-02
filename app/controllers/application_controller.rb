class ApplicationController < ActionController::Base

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo])
  end
end
