class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name bio photo posts_counter])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name bio photo posts_counter])
  end

  def authorize_request
    header = request.headers['Auth']
    header = header.split.last if header
    begin
      @decoded = JsonWebToken.decode(header)
      p @decoded
      @current_user = User.find(@decoded['id'])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end