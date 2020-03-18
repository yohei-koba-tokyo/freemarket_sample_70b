FactoryBot.define do

  factory :credit do
    authorization_code { '4242424242424242' }
    security_code      { Faker::Number.number(3).to_s }
    month              { '01' }
    year               { Time.new.year.to_s[2,2] }
    user_id            { 1 }
  end

end