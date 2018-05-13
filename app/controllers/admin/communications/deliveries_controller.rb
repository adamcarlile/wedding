class Admin::Communications::DeliveriesController < Admin::BaseController

  def redeliver
    if resource.redeliver!
      redirect_to admin_communication_path(params[:communication_id]), notice: 'Redelivery enqueued'
    else
      redirect_to admin_communication_path(params[:communication_id]), alert: 'Something went wrong'
    end
  end

  protected

  def resource
    @resource ||= Communications::Delivery.find(params[:delivery_id])
  end

end