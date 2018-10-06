class Attendance < ApplicationRecord
  belongs_to :invitee
  belongs_to :event
end
