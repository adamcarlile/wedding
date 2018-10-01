class MenuRenderer
  attr_accessor :options, :type
  attr_writer :content
  def initialize(context, options = {})
    @context = context
    @options = options
    @items   = []
  end

  def list(title, &block)
    @items << Menu::ListRenderer.new(@context, title: title, &block)
  end

  def render
    @context.content_tag(:div, class: 'menu') do
      rendered_lists
    end.html_safe
  end

  private

  def rendered_lists
    @rendered_lists ||= @items.map(&:render).join("\n").html_safe
  end

end
