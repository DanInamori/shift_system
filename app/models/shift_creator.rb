class ShiftCreator < ApplicationRecord
  belongs_to :room
  has_many :user_shift_creators, dependent: :destroy
  has_many :user, through: :user_shift_creators
end
