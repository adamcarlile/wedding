class Party < ApplicationRecord
  has_many :invitees, inverse_of: :party
  accepts_nested_attributes_for :invitees, allow_destroy: true, reject_if: :all_blank

  before_create { generate_code! }

  def to_s
    if family_name?
      [invitees.map(&:firstname).to_sentence(two_words_connector: ' & '), family_name].join(' ')
    else
      invitees.map(&:name).to_sentence(two_words_connector: ' & ')
    end
  end

  def family_name
    invitee_last_names.uniq.pop if family_name?
  end

  def family_name?
    invitee_last_names.uniq.one?
  end

  def invitee_last_names
    invitees.map(&:lastname)
  end

  private

  def generated_code
    SecureRandom.hex(3).upcase
  end

  def generate_code!
    code = generated_code
    until !self.class.where(code: code).exists?
      code = generated_code
    end
    self.code = code
  end

end
