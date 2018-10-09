class AttendanceDecorator < ApplicationDecorator
  delegate :current_user, :fa_icon, :content_tag, :link_to, to: :helpers
  delegate_all

  def html_id
    "attendance-#{invitee.id}-#{event.id}"
  end

  def tag
    content_tag(:span, taggings[state][:text], class: ["tag", taggings[state][:class]].compact.join(" "))
  end

  def controls
    content_tag(:div, class: 'buttons has-addons is-right') do
      [].tap do |array|
        array << link_to("Attending", control_links[:attend], class: "button is-primary is-small", method: :put, remote: true) unless attending?
        array << link_to("Decline", control_links[:decline], class: "button is-danger is-small", method: :put, remote: true) unless declined?
      end.join("\n").html_safe
    end
  end

  private

  def control_links
    {
      decline: helpers.authenticated_event_invitee_attendances_path(event_id: event, invitee_id: invitee, event: 'decline'),
      attend: helpers.authenticated_event_invitee_attendances_path(event_id: event, invitee_id: invitee, event: 'attend')
    }
  end

  def taggings
    {
      'pending'   => {text: 'No response yet', class: nil},
      'attending' => {text: 'Attending', class: 'is-success'},
      'declined'  => {text: 'Declined', class: 'is-danger'}
    }      
  end

end
