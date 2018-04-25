module Admin
  class CommunicationsController < BaseController

    def index
    end

    def new
    end

    def edit
    end

    protected

    def permitted_params
      params.require(:communication).permit(invitees_attributes: [:id, :firstname, :lastname, :phone, :email, :_destroy])
    end

    def collection
      @collection ||= Communication.all
    end
    helper_method :collection

    def resource
      @resource ||= params[:id] ? Communication.find(params[:id]) : Communication.new
    end
    helper_method :resource

  end
end
