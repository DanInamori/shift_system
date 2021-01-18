class UserShiftCreator < ApplicationRecord
  belongs_to :user
  belongs_to :shift_creator
end
