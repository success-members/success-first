FactoryBot.define do

	password = Faker::Internet.password(8)

  factory :customer do
    
    last_name { "山田" }
    first_name { "太郎" }
    last_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    postcode { 1234567 }
    address { "北海道札幌市" }
    phone_number { 12312341234}
    is_deleted { true }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
end
