class Communication < ApplicationRecord
  has_one_attached :image
  has_many :questions, class_name: 'Communications::Question'
  has_many :deliveries, class_name: 'Communications::Delivery'
  has_many :responses, class_name: 'Communications::Response', through: :questions

  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank

  def login_prompt
    "Click hear to let us know!"
  end
end
