class Admin::DashboardsController < Admin::BaseController

  def show
  end

  protected

  def events
    @events ||= Event.all.decorate
  end
  helper_method :events

end
