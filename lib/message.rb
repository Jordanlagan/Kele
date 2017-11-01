module Message
  def get_messages(page = nil)
    if page.nil?
      response = self.class.get(@base_api+"message_threads",
        headers: { "authorization" => @authentication_token }
      )
    else
      response = self.class.get(@base_api+"message_threads",
        headers: { "authorization" => @authentication_token },  body: { "page" => page }
      )
    end
    @messages = JSON.parse(response.body)
  end

  def create_message(sender_email, recipient_id, stripped_text, subject )
    response = self.class.post(@base_api+"messages", headers: { "authorization" => @authentication_token },
               body: { sender: sender_email, recipient_id: recipient_id, "stripped-text" => stripped_text, subject: subject })
    response.success? puts "message sent!"
  end
end
