class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters

    attributes = [:role_id, :username]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    # devise_parameter_sanitizer.permit(:account_update, keys:
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
  end


  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def authenticate_admin!
    unless current_user.admin?
      # unless current_user.role_id == Role.find_by_name("ADMIN").id
      flash[:alert] = "Доступ заборонено."
      redirect_to '/'
    end
  end
end
