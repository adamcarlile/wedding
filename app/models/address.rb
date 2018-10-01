class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :line_1, presence: true
  validates :city, presence: true
  validates :country_code, presence: true
  validates :postal_code, presence: true

  def country
    ISO3166::Country[country_code]
  end

  def country_name
    country.local_name if country
  end

  def to_s
    [line_1, line_2, region, city, postal_code, country_name].reject(&:blank?).join("\n")
  end

end
