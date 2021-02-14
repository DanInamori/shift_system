class Schedule < ApplicationRecord
  validates :name, presence: true
  validates :first_day, presence: true
  validates :last_day, presence: true
  validate :date_of_terms

  belongs_to :room
  has_many :shifts, dependent: :destroy

  def self.search(search)
    if search != ""
      Schedule.where('name LIKE(?)', "%#{search}%")
    else
      Schedule.all
    end
  end

  def date_of_terms
    if first_day.present? && last_day.present?
      if first_day >= last_day 
        errors.add(:first_day)
      end
    end
  end
end
