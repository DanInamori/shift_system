class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, length: {maximum: 8}

  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :user_schedules
  has_many :schedules, through: :user_schedules
end
