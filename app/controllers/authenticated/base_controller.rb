module Authenticated
  class BaseController < ApplicationController
    before_action :record_redirect!, unless: :logged_in?
    before_action :authenticate!

    def record_redirect!
      session[:redirect_uri] = request.path
    end
    
  end
end