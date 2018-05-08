module Admin
  class CommunicationsController < BaseController

    def index
    end

    def new
    end

    def edit
    end

    def show
    end
    
    def update
      if resource.update(permitted_params)
        resource.image.attach(params[:communication][:image]) if params[:communication][:image]
        redirect_to admin_communications_path, notice: 'Communication updated'
      else
        render :edit
      end
    end

    def create
      if resource.update(permitted_params)
        redirect_to admin_communications_path, notice: 'Communication created'
      else
        render :new
      end
    end

    def destroy
      if resource.destroy
        redirect_to admin_communications_path, notice: 'Communication deleted'
      else
        redirect_to admin_communications_path, alert: 'Looks like something went wrong'
      end
    end


    protected

    def permitted_params
      params.require(:communication).permit(:title, :body, :followup, :login_prompt, questions_attributes: [:id, :prompt, :css_class, :_destroy])
    end

    def send_form
      @send_form ||= Admin::Communications::SendersForm.new
    end
    helper_method :send_form

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
