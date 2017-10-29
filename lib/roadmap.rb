module Roadmap

  def get_roadmap(roadmap_id)
    response = self.class.get(@base_api+"roadmaps/#{roadmap_id}", headers: { "authorization" => @authentication_token })
    @roadmap = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get(@base_api+"checkpoints/#{checkpoint_id}", headers: { "authorization" => @authentication_token })
    @checkpoint = JSON.parse(response.body)
  end

end
