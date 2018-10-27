module Admin
  class AttendancesController < BaseController

    def update
      resource.aasm.fire!(params[:event].to_sym)
      redirect_back notice: "#{invitee.name}: #{params[:event]}", fallback_location: admin_root_path
    end

    private

    def event
      @event ||= Event.find(params[:event_id])
    end
    
    def invitee
      @invitee ||= Invitee.find(params[:invitee_id])
    end

    def resource
      @resource ||= event.attendances.find_or_create_by(invitee: invitee)
    end
    helper_method :resource

  end
end