require "./lib/roadmap"
require "./lib/message"
require "./lib/submission"
require "httparty"
require "json"

class Kele
  include Roadmap
  include Message
  include Submission
  include HTTParty

  def initialize(email, password)
    @base_api = "https://www.bloc.io/api/v1/"

    response = self.class.post("#{@base_api}/sessions", body: { email: email, password: password })

    raise 'Invalid credentials' if response.code == 404

    @authentication_token = response["auth_token"]
    @id = response["user"]["id"]
  end

  def get_me
    response = self.class.get(@base_api+"users/me", headers: { "authorization" => @authentication_token })
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(@base_api+"/mentors/#{mentor_id}/student_availability", headers: {"authorization" => @authentication_token })
    @mentor_availability = JSON.parse(response.body)
  end
end
