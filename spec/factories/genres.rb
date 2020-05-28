FactoryBot.define do
  factory :genre do
    name { Faker::Name.name }
	is_valid { true }
  end
end
