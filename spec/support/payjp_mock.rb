module PayjpMock
  def self.prepare_customer_information # Payjp::Customerのレスポンスモック
    {
      "id": "cus_ca9d1d98900ec1f2595aebefd9a6",
      "cards": {
        "count":1,
        "data":[{
          "id":"car_a96c76b044d7ae21439d7b9840b7",
          "address_city":nil,
          "address_line1":nil,
          "address_line2":nil,
          "address_state":nil,
          "address_zip":nil,
          "address_zip_check":"unchecked",
          "brand":"Visa",
          "country":nil,
          "created":1578830630,
          "customer":"cus_ca9d1d98900ec1f2595aebefd9a6",
          "cvc_check":"passed",
          "exp_month":12,
          "exp_year":2020,
          "fingerprint":"e1d8225886e3a7211127df751c86787f",
          "last4":"4242",
          "livemode":false,
          "metadata":{},
          "name":nil,
          "object":"card"
          }],
          "has_more":false,
          "object":"list",
          "url":"/v1/customers/cus_ca9d1d98900ec1f2595aebefd9a6/cards"
        },
      "created": 1578830631,
      "default_card": "car_a96c76b044d7ae21439d7b9840b7",
      "description": nil,
      "email": nil,
      "livemode": false,
      "metadata": {},
      "object": "customer",
      "subscriptions": {
        "count":0,
        "data":[],
        "has_more":false,
        "object":"list",
        "url":"/v1/customers/cus_ca9d1d98900ec1f2595aebefd9a6/subscriptions"
      }
    }
  end
end