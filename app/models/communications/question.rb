module Communications
  class Question < ApplicationRecord
    def self.table_name_prefix
      'communications_'
    end

    def self.css_classes
      [:accept, :maybe, :decline]
    end

    belongs_to :communication

  end
end
