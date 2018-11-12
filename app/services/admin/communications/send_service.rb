module Admin
  module Communications
    class SendService < ServiceObject

      attr_reader :communication, :form
      def initialize(communication, form)
        @communication = communication
        @form = form
      end

      def run
        if form.valid?
          invitees.each do |i| 
            ::Communications::Delivery.find_or_create_by(communication: communication, invitee: i)
          end
          fire :success, communication
        else
          fire :failure, form
        end
      end

      private

      def invitees
        @invitees ||= Invitee.where(id: form.invitee_ids)
      end

    end
  end
end