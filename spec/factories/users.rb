FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"太郎"}
    first_name            {"阿部"}
    last_name_kana        {"たろう"}
    first_name_kana       {"あべ"}
    # birthday              {"2020-02-02"}
  end

end


