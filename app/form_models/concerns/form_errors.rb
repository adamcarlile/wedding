module Concerns
  module FormErrors
    extend ActiveSupport::Concern

    def humanized_errors
      return unless errors_by_type.any?
      errors_by_type.map do |msg, fields|
        [
          fields.to_sentence,
          msg
        ].join ' '
      end.join('\n').humanize + '.'
    end

    def errors_by_type
      @errors_by_type ||= errors.messages.keys
        .group_by { |key| errors.messages[key] }
        .select { |message, _fields| message.present? }
    end
  end
end
