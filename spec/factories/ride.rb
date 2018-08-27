FactoryBot.define do
  factory :ride do
    time Faker::Time.forward(2, :morning)
    remaining_capacity {Faker::Number.between(1, 4)}
    from {'Nairobi'}
    to {'Nakuru'}
    association :vehicle
  end
end