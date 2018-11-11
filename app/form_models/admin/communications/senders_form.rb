module Admin
  module Communications
    class SendersForm
      include Virtus.model
      include ActiveModel::Conversion
      include ActiveModel::Validations
      include Concerns::FormErrors
      
      attribute :invitee_ids, Array

      def invitee_ids
        super.reject(&:blank?)
      end
    
      # In order for the form builder to work correctly
      def persisted?
        false
      end
    end
  end
end
