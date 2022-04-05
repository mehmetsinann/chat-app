class Room < ApplicationRecord
  validates_uniqueness_of :name
  validates :name, length: {minimum: 3}
  scope :public_rooms, -> {where(is_private: false)}
  after_create_commit { broadcast_append_to('rooms') unless self.is_private }
  after_destroy_commit { broadcast_remove_to('rooms') unless self.is_private}
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy

  def self.create_private_room(users, room_name)
    single_room = Room.create(name: room_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, room_id: single_room.id )
    end
    single_room
  end
end