module Communications
  class DeliveryJob < ApplicationJob

    def perform(delivery)
      delivery.deliver!
    end

  end
end