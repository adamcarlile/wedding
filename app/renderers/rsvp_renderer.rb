class EventRenderer
  attr_accessor :options, :type
  attr_writer :content
  def initialize(event, party, context, options = {})
    @event    = event
    @party    = party
    @context  = context
    @options  = options
  end

  def render
    @context.content_tag(:div, class: 'rsvp')

  # def render
  #   @context.content_tag(:div, class: 'event') do
  #     [render_header, render_content].compact.join("\n").html_safe
  #   end.html_safe
  # end

  private


end
