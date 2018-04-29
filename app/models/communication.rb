class Communication < ApplicationRecord
  has_one_attached :image
  has_many :questions, class_name: 'Communications::Question'

  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank
end
