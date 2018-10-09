module Authenticated
  class AttendancesController < BaseController
  
    def update
      resource.aasm.fire!(params[:event].to_sym)
    end

    protected

    def event
      @event ||= Event.find(params[:event_id])
    end
    helper_method :event

    def invitee
      @invitee ||= current_user.invitees.find(params[:invitee_id])
    end
    helper_method :invitee

    def resource
      @resource ||= event.attendances.find_or_create_by(invitee: invitee).decorate
    end
    helper_method :resource
    
  end
end