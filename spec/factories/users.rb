FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"aaa"}
    first_name            {"aaa"}
    last_name_kana        {"aa"}
    first_name_kana       {"aa"}
    birthday              {"2020-02-02"}
  end

end


