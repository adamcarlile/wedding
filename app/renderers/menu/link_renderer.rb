module Menu
  class LinkRenderer
    attr_reader :title, :path

    def initialize(context, title, path, &block)
      @context  = context
      @title    = title
      @path     = path
      @sub_menu = Menu::ListRenderer.new(context, &block) if block_given?
    end

    def render
      @context.content_tag(:li) do
        content
      end.html_safe
    end

    private

    def content
      [
        @context.link_to(title, path, link_options),
        rendered_sub_menu
      ].compact.join("\n").html_safe
    end

    def link_options
      out = {}
      out[:class] = 'is-active' if active?
      out
    end

    def rendered_sub_menu
      @rendered_sub_menu ||= @sub_menu.render if @sub_menu.present? && active?
    end

    def active?
      !@context.request.fullpath.match(/^#{Regexp.escape(@path).chomp('/')}(\/.*|\?.*)?$/).blank?
    end

  end
end