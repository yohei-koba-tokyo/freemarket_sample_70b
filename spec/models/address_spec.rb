require 'rails_helper'

describe Address do
  describe '#create' do
    # 1. postcodeが空では登録できないこと
    it "is invalid without a postcode" do
      address = build(:address, postcode: nil)
      address.valid?
      expect(address.errors[:postcode]).to include("can't be blank")
    end   

    # 2. prefectureが空では登録できないこと
    it "is invalid without a prefecture" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end   

    # 3. municipalityが空では登録できないこと
    it "is invalid without a municipality" do
      address = build(:address, municipality: nil)
      address.valid?
      expect(address.errors[:municipality]).to include("can't be blank")
    end   

    # 4. addressが空では登録できないこと
    it "is invalid without a address" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("can't be blank")
    end   

#     it "is valid with a phone_num that Phone number format " do
#       user = build(:user, phone_num: "08012345678")
#       user.valid?
#       expect(user).to be_valid
#     end

#     it "is invalid with a phone_num that Phone number format " do
#       user = build(:user, phone_num: "a8012345678")
#       user.valid?
#       expect(user.errors[:phone_num][0]).to include("の入力が正しくありません")
#     end
  end



end