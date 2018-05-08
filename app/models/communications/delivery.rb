class Communications::Delivery < ApplicationRecord
  include ActiveModel::Transitions 

  belongs_to :invitee
  has_one :party, through: :invitee
  belongs_to :communication

  after_create :enqueue

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

  def enqueue
    Communications::DeliveryJob.perform_later(self.to_global_id.to_s)
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
