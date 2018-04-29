module Admin
  class PartiesController < BaseController

    def index
    end

    def new
    end

    def edit
    end

    def update
      if resource.update(permitted_params)
        redirect_to admin_parties_path, notice: 'Party updated'
      else
        render :edit
      end
    end

    def create
      if resource.update(permitted_params)
        redirect_to admin_parties_path, notice: 'Party created'
      else
        render :new
      end
    end

    def destroy
      if resource.destroy
        redirect_to admin_parties_path, notice: 'Party deleted'
      else
        redirect_to admin_parties_path, alert: 'Looks like something went wrong'
      end
    end

    protected

    def permitted_params
      params.require(:party).permit(:category, :priority, invitees_attributes: [:id, :firstname, :lastname, :phone, :email, :_destroy])
    end

    def collection
      @collection ||= Party.all
    end
    helper_method :collection

    def resource
      @resource ||= params[:id] ? Party.find(params[:id]) : Party.new
    end
    helper_method :resource

  end
end