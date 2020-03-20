FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000aaaa"}
    password_confirmation {"0000aaaa"}
    last_name             {"太郎"}
    first_name            {"阿部"}
    last_name_kana        {"たろう"}
    first_name_kana       {"あべ"}
  end

end


