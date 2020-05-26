FactoryBot.define do

	password = Faker::Internet.password(8)

  factory :admin do
    
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
end
