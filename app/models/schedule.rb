class Schedule < ApplicationRecord
  validates :name, presence: true
  validates :first_day, presence: true
  validates :last_day, presence: true

  belongs_to :room
  has_many :user_schedules
  has_many :users, through: :user_schedules
  has_many :shifts, dependent: :destroy

  def self.search(search)
    if search != ""
      Schedule.where('name LIKE(?)', "%#{search}%")
    else
      Schedule.all
    end
  end
end
