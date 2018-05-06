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
          invitees.each {|i| ::Communications::Delivery.find_or_create_by(communication: communication, invitee: i).deliver! }
        else
          fire :failure, form
        end
      end

      private

      def invitees
        @invitees ||= Invitee.joins(:party).where(parties: { priority: form.party_priority_group })
      end

    end
  end
end