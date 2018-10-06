class Event < ActiveRecord::Base
  has_many :invitees, through: :attendances
end