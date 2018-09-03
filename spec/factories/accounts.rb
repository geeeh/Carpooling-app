FactoryBot.define do
  factory :account do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    identification {'3363144225'}
    phone_number {'+254706892980'}
    association :user
  end
end
