class Communication < ApplicationRecord
  has_one_attached :image

  has_many :questions, class_name: 'Communications::Question'
end
