class Shift < ApplicationRecord
  validates :work_day, presence: true
  
  belongs_to :user
  belongs_to :schedule
  
end
