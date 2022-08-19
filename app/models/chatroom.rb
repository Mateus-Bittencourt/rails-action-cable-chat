class Chatroom < ApplicationRecord
  before_create do
    opentok = OpenTok::OpenTok.new '47557071', '5d3a8f493e5219176682adf8f82d924be6afe32b'
    session = opentok.create_session
    self.vonage_session_id = session.session_id
  end
  has_many :messages
end
