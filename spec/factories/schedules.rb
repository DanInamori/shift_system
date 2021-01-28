FactoryBot.define do
  factory :schedule do
    name {Faker::Name.initials}
    first_day {Date.today}
    last_day  {Faker::Date.forward} 
    association :room
  end
end
