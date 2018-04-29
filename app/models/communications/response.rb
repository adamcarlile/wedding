class Communications::Response < ApplicationRecord
  belongs_to :party
  belongs_to :question, class_name: 'Communications::Question'
end
