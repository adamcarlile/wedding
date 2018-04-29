module Communications
  class DeliveryJob < ApplicationJob

    def perform(delivery_gid)
      @delivery = GlobalID.find(delivery_gid)

      delivery.deliver!
    end

  end
end