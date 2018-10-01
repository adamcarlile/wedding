module Authenticated
  class CommunicationsController < BaseController
    def index
    end

    def show
    end

    protected

    def collection 
      @collection ||= current_user.communication_deliveries.decorate
    end
    helper_method :collection

    def resource
      @resource ||= current_user.communications.find(params[:id])
    end
    helper_method :resource

  end
end
