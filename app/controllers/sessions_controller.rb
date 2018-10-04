class SessionsController < ApplicationController

  def create
    if form.valid? && authenticate!
      redirect_to details_authenticated_content_path
    end
  end

  def destroy
    logout if current_user.present?
    redirect_to root_path
  end

  protected

  def form
    @form ||= Sessions::CredentialsForm.new(permitted_params)
  end
  helper_method :form

  def permitted_params
    params.require(:user).permit(:code, :lastname)
  end

end


