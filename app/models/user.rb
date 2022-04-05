class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :username
  validates :username, length: {minimum: 3}, presence: true
  validates :password_digest, presence: true, on: [:update,:save]
  validates :password, length: {minimum: 6}, presence: true, on: :create
  scope :all_except, -> (user) { where.not(id: user) }
  after_create_commit { broadcast_append_to('users') }
  after_destroy_commit { broadcast_remove_to('users') }
  after_update_commit { broadcast_replace_to('users') }
  has_many :messages, dependent: :destroy

end