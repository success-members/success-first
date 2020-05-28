FactoryBot.define do

	password = Faker::Internet.password(8)

    factory :customer do

        last_name { "山田" }
        first_name { "太郎" }
        last_name_kana { "ヤマダ" }
        first_name_kana { "タロウ" }
        postcode { 1234567 }
        address { "北海道札幌市" }
        phone_number { 12341234123 }
        is_deleted { true }
        email { "1@1" }
        password { password }
        password_confirmation { password }

    # last_name { Faker::Name.last_name }
    # first_name { Faker::Name.first_name }
    # last_name_kana { Faker::Lorem.characters(number:10) }
    # first_name_kana { Faker::Lorem.characters(number:10) }
    # postcode { Faker::Number.number(7) }
    # address { Faker::Lorem.characters }
    # phone_number { Faker::Number.number(11) }
    # is_deleted { true }
    # email { Faker::Internet.safe_email }
    # password { password }
    # password_confirmation { password }
  end
end
