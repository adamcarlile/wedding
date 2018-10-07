module Authenticated
  class AttendancesController < BaseController
  
    def create
      invitee.attend!(event)
    end

    def destroy
      invitee.decline!(event)
    end

    protected

    def event
      @event ||= Event.find_by(code: params[:event_id])
    end
    helper_method :event

    def invitee
      @invitee ||= current_user.invitees.find(params[:id])
    end
    helper_method :invitee
    
  end
end