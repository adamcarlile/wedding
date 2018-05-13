class Communications::Delivery < ApplicationRecord
  include ActiveModel::Transitions 

  scope :deleted, ->() { where(state: 'deleted') }
  scope :active,  ->() { where.not(state: 'deleted') }

  belongs_to :invitee
  has_one :party, through: :invitee
  belongs_to :communication

  after_create :enqueue

  state_machine do
    state :pending
    state :dispatched
    state :failed
    state :deleted

    event :dispatch do
      transitions to: :dispatched, from: [:pending, :failed]
    end

    event :unsuccessful do
      transitions to: :failed, from: :pending
    end

    event :delete do
      transitions to: :deleted, from: [:pending, :dispatched, :failed]
    end
  end

  def redeliver!
    self.class.create(communication: communication, invitee: invitee)
    delete!
  end

  def enqueue
    Communications::DeliveryJob.perform_later(self.to_global_id.to_s)
  end

  def deliver!
    return if dispatched? || deleted?
    CommunicationsMailer.question(self).deliver
    dispatch!
  rescue => e
    unsuccessful
    raise e
  end

end
