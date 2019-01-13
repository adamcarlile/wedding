class EventDecorator < ApplicationDecorator
  delegate_all
  
  def attending
    attendances.joins(:invitee).attending.order(created_at: :desc).order('invitees.party_id')
  end

  def declined
    attendances.joins(:invitee).declined.order(created_at: :desc).order('invitees.party_id')
  end

  def undecided
    @undecided ||= Invitee.where(id: undecided_ids).order(:party_id).map { |i| event.attendances.new(invitee: i) }
  end

  private

  def decided
    @decided ||= attendances.pluck(:invitee_id)
  end

  def undecided_ids
    all_invitees.pluck(:id) - decided
  end

  def all_invitees
    @all_invitees ||= Invitee.all
  end

end