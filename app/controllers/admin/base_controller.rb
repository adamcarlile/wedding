module Admin
  class BaseController < ApplicationController
    layout '/admin/layouts/application'
    if Rails.application.config.admin.username && Rails.application.config.admin.password
      http_basic_authenticate_with name: Rails.application.config.admin.username, password: Rails.application.config.admin.password
    end

    protected

    def title
      controller_name.titleize
    end
    helper_method :title

  end
end
