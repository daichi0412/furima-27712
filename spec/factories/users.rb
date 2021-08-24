FactoryBot.define do

  factory :user do
    nickname              {"daichi"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    encrypted_password    {"00000000"}
    last_name             {"中原"}
    first_name            {"大地"}
    pseudonym_last        {"ナカハラ"}
    pseudonym_first       {"ダイチ"}
    birthday              {"1995/6/2"}
  end

end