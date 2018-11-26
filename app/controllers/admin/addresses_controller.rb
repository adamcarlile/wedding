module Admin
  class AddressesController < BaseController

    def index
    end

    protected

    def collection
      @colletion ||= Party.left_joins(:address).order('addresses.id')
    end
    helper_method :collection

  end
end
