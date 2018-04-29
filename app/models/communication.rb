class Communication < ApplicationRecord
  has_one_attached :image
  has_many :questions, class_name: 'Communications::Question'

  has_many :deliveries, class_name: 'Communications::Delivery'

  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank
end
