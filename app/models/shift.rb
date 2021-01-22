class Shift < ApplicationRecord
  # validates :work_day, presence: true
  validates :clock_or_check, presence: true
  
  belongs_to :user
  belongs_to :schedule
  
  private

  def clock_or_check
    clock_in.presence or clock_out.presence or check.presence
  end
end
