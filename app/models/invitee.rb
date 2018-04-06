class Invitee < ApplicationRecord
  belongs_to :party, counter_cache: true

  def name
    [firstname, lastname].join(' ')
  end
end
