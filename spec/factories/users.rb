FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"アベ"}
    first_name            {"タロウ"}
    last_name_kana        {"アベ"}
    first_name_kana       {"タロウ"}
    birthday              {"2020-02-02"}
  end

end


