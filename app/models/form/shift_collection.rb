class Form::ShiftCollection < Form::Base
  attr_accessor :shifts

  def initialize( attributes, form_count)
    super attributes
    self.shifts = form_count.times.map {Shift.new()} unless self.shifts.present?
  end
  
  def shifts_attributes=(attributes)
    self.shifts = attributes.map {|_, shift| Shift.new(shift)}
  end

  def register_ids(user_id, schedule_id)
    self.shifts.map do |shift| 
      shift.user_id = user_id
      shift.schedule_id = schedule_id
    end
  end
  
  def save
    Shift.transaction do
      self.shifts.map do |shift|
        shift.save
      end
    end
      return true
    rescue => e
      return false
  end
end
