class UserSession < Authlogic::Session::Base
  # configuration here, see documentation for sub modules of Authlogic::Session
  params_key :api_token
  single_access_allowed_request_types :any

end
