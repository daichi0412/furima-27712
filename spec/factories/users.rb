FactoryBot.define do

  factory :user do
    nickname              {"daichi"}
    email                 {"kkk@gmail.com"}
    password              {"baske2525"}
    encrypted_password    {"baske2525"}
    last_name             {"中原"}
    first_name            {"大地"}
    pseudonym_last        {"ナカハラ"}
    pseudonym_first       {"ダイチ"}
    birthday              {"1995/6/2"}
  end
end