class Party < ApplicationRecord
  CATEGORIES = [:grooms_family, :grooms_friends, :brides_family, :brides_friends]
  PRIORITIES = [:high, :medium, :low]

  has_many :invitees, inverse_of: :party, dependent: :destroy
  has_many :communications, -> { distinct }, through: :invitees
  has_many :responses, class_name: 'Communications::Response', dependent: :destroy
  has_many :access_codes, class_name: 'AuthCode', as: :authable, dependent: :destroy

  accepts_nested_attributes_for :invitees, allow_destroy: true, reject_if: :all_blank

  before_create { generate_code! }

  validates :category, presence: true
  validates :priority, presence: true

  scope :category, ->(cat) { where(category: cat) }
  scope :priority, ->(pri) { where(priority: pri) }

  def access_code
    access_codes.first_or_create
  end

  def email_supplied?
    invitees.map {|x| x.email.present? }.any?
  end

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
