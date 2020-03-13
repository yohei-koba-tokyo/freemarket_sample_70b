require 'rails_helper'

describe User do
  describe '#create' do

    # 1. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 2. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 3. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 4. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 5. nicknameが7文字以上であれば登録できないこと
    it "is invalid with a nickname that has more than 7 characters " do
      user = build(:user, nickname: "aaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end

    # 6. nicknameが6文字以下では登録できること
    it "is valid with a nickname that has less than 6 characters " do
      user = build(:user, nickname: "abe")
      expect(user).to be_valid
    end

    # 7. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 8. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    # 9. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    # 10. last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 11. first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end    

    # 12. last_name_kanaが空では登録できないこと
    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end   

    # 13. first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end   

    # # 14. birthdayが空では登録できないこと
    # it "is invalid without a birthday" do
    #   user = build(:user, birthday: nil)
    #   user.valid?
    #   expect(user.errors[:birthday]).to include("can't be blank")
    # end   

    # 15. last_nameは半角では登録できないこと
    it "is invalid without a last_name is full-width" do
      user = build(:user, last_name: "aa")
      user.valid?
      expect(user.errors[:last_name]).to include("must be full-width")
    end 

    # 16. first_nameは半角では登録できないこと
    it "is invalid without a first_name is full-width" do
      user = build(:user, first_name: "aa")
      user.valid?
      expect(user.errors[:first_name]).to include("must be full-width")
    end 

    # 17. last_name_kanaは平仮名全角以外では登録できないこと
    it "is invalid without a last_name_kana is full-width" do
      user = build(:user, last_name_kana: "タロウ")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("must be full-width")
    end 

    # 18. first_name_kanaは平仮名全角以外では登録できないこと
    it "is invalid without a first_name_kana is full-width" do
      user = build(:user, first_name_kana: "アベ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("must be full-width")
    end 
    
  end
end