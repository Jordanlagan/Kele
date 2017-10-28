require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
    @email = email
    @password = password
    @base_api = "https://www.bloc.io/api/v1/sessions"

    response = self.class.post(@base_api, body: { email: @email, password: @password })
    if response.code == 404
      raise 'Invalid credentials'
    end

    @authentication_token = response["auth_token"]
  end
end
