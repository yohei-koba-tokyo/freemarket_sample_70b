FactoryBot.define do
  factory :user, class: User do
    nickname              {"team70b_bot"}
    email                 {"t70.kobayashi.yohei@gmail.com"}
    password              {"29gaaaaa"}
    password_confirmation {"29gaaaaa"}
    first_name            {"70b"}
    last_name             {"bot"}
    first_name_kana     {"70b"}
    last_name_kana      {"bot"}
    birthday              {"1982-10-20"}
  end
end