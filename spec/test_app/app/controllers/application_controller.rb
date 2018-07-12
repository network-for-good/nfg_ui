class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :supply_default_stylesheet_param

  def supply_default_stylesheet_param
    if controller_path.include?('bootstrap')
      redirect_to url_for if params[:stylesheet].present?  
    elsif params[:stylesheet].nil?
      redirect_to url_for(stylesheet: 'public')
    end
  end
end
