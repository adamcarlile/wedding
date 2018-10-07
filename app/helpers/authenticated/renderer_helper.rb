module Authenticated
  module RendererHelper
    def render_menu(**options, &block)
      renderer = MenuRenderer.new(self)
      yield(renderer) if block_given?
      renderer.render
    end

    def render_event(**options, &block)
      renderer = EventRenderer.new(self, options)
      yield(renderer) if block_given?
      renderer.render
    end
    
  end
end