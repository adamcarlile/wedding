class EventRenderer
  attr_accessor :options, :type
  attr_writer :content
  def initialize(context, options = {}, &block)
    @context = context
    @content = @context.capture(&block) if block_given?
    @options = options
  end

  def title(string)
    @title = string
  end

  def subtitle(string)
    @subtitle = string
  end

  def image(url)
    @image = url
  end

  def render
    # @context.content_tag(:div, class: 'event') do
    #   @context.content_tag(:div, class: 'header') do
    #     @context.image_tag(@image) if @image
    #   end
    #   rendered_lists
    # end.html_safe
  end

  private

  def rendered_lists
    @rendered_lists ||= @items.map(&:render).join("\n").html_safe
  end

end
