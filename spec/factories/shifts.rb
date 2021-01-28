FactoryBot.define do
  factory :shift do
    work_day {Faker::Date.forward}
    clock_in {Faker::Time.forward}
    clock_out {Faker::Time.forward}
    check {"off"}
    association :user
    association :schedule
  end
end
