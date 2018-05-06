module Communications
  class Question < ApplicationRecord
    def self.table_name_prefix
      'communications_'
    end

    def self.css_classes
      [:accept, :maybe, :decline]
    end

    belongs_to :communication

    def record_response!(party)
      Communications::Response.find_or_create_by(party: party, question: self)
    end

  end
end
