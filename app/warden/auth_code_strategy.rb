class AuthCodeStrategy < Warden::Strategies::Base
  def valid?
    binding.pry
    params[:token].present?
  end

  def authenticate!
    if auth_code.present? && party.present?
      auth_code.increment!
      success!(party)
    else
      fail!("Oops, looks like we couldn't match those login details")
    end
  end

  private

  def auth_code
    @auth_code ||= AuthCode.find_by(token: params[:token])
  end

  def party
    @party ||= auth_code.authable
  end
 
end