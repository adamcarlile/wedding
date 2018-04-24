class PartyCodeStrategy < Warden::Strategies::Base
  def valid?
    code && lastname
  end

  def authenticate!
    if party.present? && lastnames.include?(lastname.downcase)
      success!(party)
    else
      fail!
    end
  end

  private

  def party
    @party ||= Party.find_by(code: code.upcase)
  end

  def lastnames
    @lastnames ||= party.invitees.pluck(:lastname).uniq.map(&:downcase)
  end

  def code
    user_params[:code]
  end

  def lastname
    user_params[:lastname]
  end

  def user_params
    params[:user] || {}
  end
end