class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  belongs_to :role
end
