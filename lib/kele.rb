require 'httparty'
require 'json'

class Kele
  include HTTParty

  def initialize(email, password)
    @email = email
    @password = password
    @base_api = "https://www.bloc.io/api/v1/"

    response = self.class.post(@base_api+"sessions", body: { email: @email, password: @password })
    if response.code == 404
      raise 'Invalid credentials'
    end

    @authentication_token = response["auth_token"]
    @id = response["user"]["id"]
  end

  def get_me
    response = self.class.get(@base_api+"users/me", headers: { "authorization" => @authentication_token })
    JSON.parse(response.body)
  end
end
