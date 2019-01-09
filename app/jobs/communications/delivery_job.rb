module Communications
  class DeliveryJob < ApplicationJob

    def perform(delivery_gid)
      GlobalID.find(delivery_gid).deliver!
    end

  end
end