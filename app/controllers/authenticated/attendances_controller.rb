module Authenticated
  class AttendancesController < BaseController
  
    def create
    end

    protected
    def resource
      @resource ||= current_user.invitees.find(params[:id])
    end
  
  end
end