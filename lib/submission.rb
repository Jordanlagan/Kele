module Submission
  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id)
    response = self.class.post(@base_api+"checkpoint_submissions",
      body: { checkpoint_id: checkpoint_id, assignment_branch: assignment_branch,
      assignment_commit_link: assignment_commit_link, comment: comment,
      enrollment_id: enrollment_id }, headers: { authorization: @authentication_token }
    )
    @submission = JSON.parse(response.body)
  end
end
