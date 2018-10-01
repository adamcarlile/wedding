module Menu
  class ListRenderer
    attr_reader :context

    def initialize(context, title: nil, options: {}, &block)
      @context  = context
      @title    = title
      @options  = options
      @links    = []
      yield(self) if block_given?
    end

    def title?
      @title.present?
    end

    def link(name, path, &block)
      @links << Menu::LinkRenderer.new(context, name, path, &block)
    end

    def render
      out = []
      out << context.content_tag(:p, @title, class: 'menu-label') if title?
      out << context.content_tag(:ul, rendered_links, class: 'menu-list')
      out.join("\n").html_safe
    end

    private

    def rendered_links
      @rendered_links ||= @links.map(&:render).join("\n").html_safe
    end

  end
end