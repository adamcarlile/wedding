class Invitee < ApplicationRecord
  belongs_to :party, counter_cache: true

  has_many :comminication_deliveries, class_name: 'Communications::Delivery'

  has_many :communications, through: :comminication_deliveries

  validates :firstname, presence: true
  validates :lastname, presence: true

  def name
    [firstname, lastname].join(' ')
  end
end
