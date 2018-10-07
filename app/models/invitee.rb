class Invitee < ApplicationRecord
  belongs_to :party, counter_cache: true

  has_many :communication_deliveries, class_name: 'Communications::Delivery', dependent: :destroy
  has_many :communications, through: :communication_deliveries

  has_many :attendances
  has_many :events, through: :attendances

  validates :firstname, presence: true
  validates :lastname, presence: true

  def to_email
    "#{name} <#{email}>"
  end

  def name
    [firstname, lastname].join(' ')
  end

  def attend!(event)
    attendances.find_or_create_by(event: event)
  end

  def decline!(event)
    attendances.find_by(event: event)&.destroy
  end

  def attending?(event)
    attendances.find_by(event: event)
  end

end
