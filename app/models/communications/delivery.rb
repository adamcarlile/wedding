class Communications::Delivery < ApplicationRecord
  belongs_to :invitee
  belongs_to :communication
end
