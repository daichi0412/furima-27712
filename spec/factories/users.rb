FactoryBot.define do

  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             {"中原"}
    first_name            {"大地"}
    pseudonym_last        {"ナカハラ"}
    pseudonym_first       {"ダイチ"}
    birthday              {"1995/6/2"}
  end
end