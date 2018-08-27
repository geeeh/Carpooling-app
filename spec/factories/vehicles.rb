FactoryBot.define do
  factory :vehicle do
    make Faker::Vehicle.make_and_model
    colour Faker::Vehicle.color
    plate {'KBS 244S'}
    capacity {4}
    association :user
  end
end
# Faker::Vehicle.license_plate('FL')