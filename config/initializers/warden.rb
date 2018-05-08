Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :party_code, :auth_code
  manager.failure_app = -> (env) { HomepageController.action(:show).call(env) }
  manager.intercept_401 = false
end

Rails.configuration.to_prepare do
  Warden::Manager.serialize_into_session do |party|
    party.id
  end
  
  Warden::Manager.serialize_from_session do |id|
    Party.find(id)
  end

  Warden::Strategies.add(:party_code, PartyCodeStrategy)
  Warden::Strategies.add(:auth_code, AuthCodeStrategy)
end

