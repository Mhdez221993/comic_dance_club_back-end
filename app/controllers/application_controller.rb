class ApplicationController < ActionController::API
  # include RackSessionFixController
  # include ActionController::RequestForgeryProtection

  # protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end
end