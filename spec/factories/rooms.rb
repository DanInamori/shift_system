FactoryBot.define do
  factory :room do
    name {Faker::Name.initials}
  end
end

