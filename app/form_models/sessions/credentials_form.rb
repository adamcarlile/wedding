module Sessions
  class CredentialsForm
    include Virtus.model
    include ActiveModel::Conversion
    include ActiveModel::Validations
    include Concerns::FormErrors
    
    attribute :code,     String
    attribute :lastname, String

    validates :code, :lastname, presence: true

    # In order for the form builder to work correctly
    def persisted?
      false
    end
  end
end
