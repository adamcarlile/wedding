class Admin::Communications::SendsController < ApplicationController

  def create
    Admin::Communications::SendService.run!(communication, send_form) do |on|
      on.success ->() { redirect_to :back }
      on.failure ->() { redirect_to :back, alert: 'Oops, looks like something went wrong'}
    end
  end

  protected

  def permitted_params
    params.require(:senders_form).permit(:party_priority_group)
  end

  def send_form
    Admin::Communications::SendersForm.new(permitted_params)
  end

  def communication
    @communication ||= Communication.find(params[:communication_id])
  end

end
