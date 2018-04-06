module Admin
  module RendererHelper

    def render_flashes(options = {})
      return if flash.blank?
      content_tag(:div, id: 'flashes') do
        output = flash.map do |k, v|
          next if v.blank?
          render_flash(k.to_sym, options) { content_tag(:p, v) }
        end
        output.compact.join("\n").html_safe
      end
    end

    def render_flash(type, options = {}, &block)
      renderer = FlashRenderer.new(self, type, options)
      renderer.content = capture(&block) if block_given?
      renderer.render
    end

  end
end
