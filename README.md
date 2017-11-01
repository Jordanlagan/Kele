## Kele


### Installation
 - gem 'kele'
 - $ bundle

Or install it yourself as:
 - $ gem install kele

### Features
Kele can use the Bloc API to do a variety of things. 
 - Retrieve User Info
 - Get Mentor Availability
 - Retrieve Message threads
 - Send a Message
 - Submit a Checkpoint
 - Update a Checkpoint

#### Set up
 - Require kele Gem on irb `require './lib/kele'`
(If it does not work, run irb -r kele -I ./lib)
 - Store your information in a new object `user = Kele.new('test@example.com', 'helloworld')`

#### Retrieving user info
- `user.get_me`

#### Getting Mentor Availability
 - `user.get_mentor_availability(mentor_id)`

#### Checking Roadmaps and Checkpoints
`roadmap_id = 123
checkpoint_id = 123
user.get_roadmap(roadmap_id)
user.get_checkpoint(checkpoint_id)`

#### Retrieving and sending messages
`user.get_messages(page)
user.create_message(sender_email, recipient_id, message_body, subject)`

#### Submitting and updating Checkpoints
`user.create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id)
user.update_submission(id, assignment_branch, assignment_commit_link, checkpoint_id, comment, enrollment_id)`

### License

The gem is available as open source under the terms of the MIT License.

To read more about the Bloc API visit [here](http://docs.blocapi.apiary.io/#reference/0/sessions)
