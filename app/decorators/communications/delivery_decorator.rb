module Communications
  class DeliveryDecorator < ApplicationDecorator
    delegate :current_user, :fa_icon, to: :helpers
    delegate_all

    def responded?
      responses.for_party(current_user).any?
    end

    def icon
      fa_icon(icon_name)
    end

    def html_attributes
      {
        class: css_classes
      }
    end

    private

    def css_classes
      @css_classes ||= [].tap do |array|
        array << 'unread' unless responded?
      end
    end

    def icon_name
      responded? ? 'envelope-open-o' : 'envelope-o'
    end
    
  end
end
