module Admin
  module Communications
    class SendersForm
      include Virtus.model
      include ActiveModel::Conversion
      include ActiveModel::Validations
      include Concerns::FormErrors
      
      attribute :party_priority_group, String
    
      # In order for the form builder to work correctly
      def persisted?
        false
      end
    end
  end
end
