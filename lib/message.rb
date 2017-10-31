module Message
  def get_messages(page = 'all')
    if !page == 'all'
      response = self.class.get(@base_api+"message_threads", body: { :page => page },
        headers: { "authorization" => @authentication_token }
      )
    else
      response = self.class.get(@base_api+"message_threads",
        headers: { "authorization" => @authentication_token }
      )
    end
    @messages = JSON.parse(response.body)
  end

  def create_message(recipient_id, token, subject, stripped_text)
    response = self.class.post(@base_api+"messages", body: { :sender => @id,
       :recipient_id => recipient_id, :token => token, :subject => subject,
       "stripped-text" => stripped_text }, headers: { "authorization" => @authentication_token }
       )
    @created_message = JSON.parse(response.body)
  end
end
