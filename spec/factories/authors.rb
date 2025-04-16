FactoryBot.define do
  factory :author do
    name { Faker::Name.name  }
    age { 30 }
  end
end
