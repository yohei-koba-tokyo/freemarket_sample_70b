FactoryBot.define do

  factory :item do
    name          {"カントリーマーム半年分"}
    explanation   {"賞味期限まで後少しなので値下げします！"}
    brand         {"不二家"}
    condition     {"新品、未使用"}
    postage       {"着払い（購入者負担）"}
    area          {"愛知県"}
    day           {"１〜２日で発送"}
    price         {5000}
    user_id       {"1"}
    category_id   {"245"}
    status        {1}
  end

  

end