module Authenticated
  module RendererHelper
    def render_menu(**options, &block)
      renderer = MenuRenderer.new(self)
      yield(renderer) if block_given?
      renderer.render
    end
  end
end