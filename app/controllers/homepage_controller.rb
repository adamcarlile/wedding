class HomepageController < ApplicationController
  layout 'layouts/homepage'
  before_action :redirect_to_dashboard, if: :logged_in?

  def show
  end

  protected

  def redirect_to_dashboard
    redirect_to authenticated_dashboards_path
  end

  def login_form
    @login_form ||= Sessions::CredentialsForm.new
  end
  helper_method :login_form

end
