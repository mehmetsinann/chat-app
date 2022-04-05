class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  before_create :confirm_participant
  after_create_commit { broadcast_append_to self.room }
  after_destroy_commit { broadcast_remove_to self.room }
  validates :content, length: {minimum: 1}

  def confirm_participant
    if self.room.is_private
      is_participant = Participant.where(user_id: self.user.id, room_id: self.room.id).first
      throw :abort unless is_participant
    end
  end
end