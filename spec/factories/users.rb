FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"aaa"}
    first_name            {"aaa"}
    last_name_kana        {"ア"}
    first_name_kana       {"ア"}
    birthday              {"2020-02-02"}
  end

end


