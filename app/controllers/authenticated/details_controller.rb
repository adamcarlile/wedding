module Authenticated
  class DetailsController < BaseController

    def edit
      
    end

    def update
      if resource.update(permitted_params)
        redirect_to edit_authenticated_details_path, notice: 'Party updated'
      else
        render :edit
      end
    end

    protected

    def permitted_params
      params.require(:party).permit({
        invitees_attributes: [:id, :firstname, :lastname, :phone, :email, :attendance], 
        address_attributes: [:id, :line_1, :line_2, :city, :region, :postal_code, :country_code]
      })
    end

    def resource
      @resource ||= current_user
    end
    helper_method :resource

  end
end
