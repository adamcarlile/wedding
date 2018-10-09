class Attendance < ApplicationRecord
  include AASM

  belongs_to :invitee
  belongs_to :event

  aasm column: :state do
    state :pending, initial: true
    state :attending, :declined

    event :attend do
      transitions from: [:pending, :declined], to: :attending
    end

    event :decline do
      transitions from: [:pending, :attending], to: :declined
    end
  end

end


