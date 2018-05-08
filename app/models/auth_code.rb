class AuthCode < ApplicationRecord
  belongs_to :authable, polymorphic: true
  has_secure_token

  def increment!
    update(usage_count: usage_count + 1)
  end
end
