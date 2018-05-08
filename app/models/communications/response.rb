class Communications::Response < ApplicationRecord
  belongs_to :party
  belongs_to :question, class_name: 'Communications::Question'

  scope :for_party, ->(party) { where(party: party) }

end
