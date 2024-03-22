class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  # validates :username, presence: true
  # validates :username, uniqueness: true
  has_many :comments
  has_many :posts
  belongs_to :role, optional: true

  def admin?
    role_id == Role.find_by_name("ADMIN").id
  end

end
