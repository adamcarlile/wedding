class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError, with: :redirect_home

  def redirect_home
    redirect_to root_path
  end

end
