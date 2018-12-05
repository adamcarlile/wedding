class EventRenderer
  attr_accessor :options, :type
  attr_writer :content
  def initialize(context, options = {})
    @context = context
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

  def content(&block)
    @content = @context.capture(&block) if block_given?
  end

  def render
    @context.content_tag(:div, html_options) do
      [render_header, render_content].compact.join("\n").html_safe
    end.html_safe
  end

  private

  def html_options
    {
      class: 'event'
    }.merge(@options.slice(:id))
  end

  def header
    [].tap do |output|
      output << @context.image_tag(@image) if @image
      output << @context.content_tag(:div, header_titles, class: 'titles') unless header_titles.blank?
    end.compact.join("\n").html_safe
  end

  def header_titles
    [].tap do |output|
      output << @context.content_tag(:h4, @title) if @title
      output << @context.content_tag(:h5, @subtitle) if @subtitle
    end.compact.join("\n").html_safe
  end

  def render_header
    @context.content_tag(:div, header, class: 'header')
  end

  def render_content
    @context.content_tag(:div, @content, class: 'content')
  end

end
