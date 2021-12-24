class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  before_action :authenticate_user!


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password,:name,:last_name,:phone_number,:admin])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password,:name,:last_name,:phone_number,:admin])
  end
end
