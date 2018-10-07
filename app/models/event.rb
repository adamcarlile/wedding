class Event < ActiveRecord::Base
  has_many :attendances
  has_many :invitees, through: :attendances
end