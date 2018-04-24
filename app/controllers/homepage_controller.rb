class HomepageController < ApplicationController
  layout 'layouts/homepage'

  def show
  end

  protected

  def login_form
    @login_form ||= Sessions::CredentialsForm.new
  end
  helper_method :login_form

end
