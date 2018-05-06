class Communications::Delivery < ApplicationRecord
  include ActiveModel::Transitions 

  belongs_to :invitee
  belongs_to :communication

  state_machine do
    state :pending
    state :dispatched
    state :failed

    event :dispatch do
      transitions to: :dispatched, from: [:pending, :failed]
    end

    event :unsuccessful do
      transitions to: :failed, from: :pending
    end
  end

  def deliver!
    return if dispatched?
    CommunicationsMailer.question(self).deliver
    dispatch!
  rescue => e
    unsuccessful
    raise e
  end

end
