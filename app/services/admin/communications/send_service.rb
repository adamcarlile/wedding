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
            next if i.email.blank? || already_sent_to_party?(i)
            ::Communications::Delivery.find_or_create_by(communication: communication, invitee: i)
          end
          fire :success, communication
        else
          fire :failure, form
        end
      end

      private

      def invitees
        @invitees ||= Invitee.joins(:party).where(parties: { priority: form.party_priority_group })
      end

      def already_sent_to_party?(invitee)
        invitee.party.communications.include? communication
      end

    end
  end
end