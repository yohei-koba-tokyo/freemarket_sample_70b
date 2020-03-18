require 'rails_helper'



RSpec.describe Credit, type: :model do
  describe '#create' do
    before do
      create(:user)
    end

    context "can save" do
      # 登録可能（全項目あり）
      it "is valid with all properties" do
        credit_card = build(:credit)
        expect(credit_card).to be_valid
      end

#       # 登録可能（authorization_code、14桁）
#       it "is invalid with authorization_code(14 characters)" do
#         credit_card = build(:credit, authorization_code: '12345678901234')
#         expect(credit_card).to be_valid
#       end

#       # 登録可能（authorization_code、16桁）
#       it "is invalid with authorization_code(16 characters)" do
#         credit_card = build(:credit, authorization_code: '1234567890123456')
#         expect(credit_card).to be_valid
#       end

#       # 登録可能（security_code、3桁）
#       it "is invalid with security_code(3 characters)" do
#         credit_card = build(:credit, security_code: '123')
#         expect(credit_card).to be_valid
#       end

#       # 登録可能（security_code、4桁）
#       it "is invalid with security_code(4 characters)" do
#         credit_card = build(:credit, security_code: '1234')
#         expect(credit_card).to be_valid
#       end

#       # 登録可能（month、1月）
#       it "is invalid with month(January)" do
#         credit_card = build(:credit, month: '01')
#         expect(credit_card).to be_valid
#       end

#       # 登録可能（month、12月）
#       it "is invalid with month(December)" do
#         credit_card = build(:credit, month: '12')
#         expect(credit_card).to be_valid
#       end

#       # 登録可能（year、今年）
#       it "is invalid with year(14 characters)" do
#         credit_card = build(:credit, year: "#{Time.new.year.to_s[2,2]}")
#         expect(credit_card).to be_valid
#       end

#       # 登録可能（year、10年度）
#       it "is invalid with year(10 years later)" do
#         credit_card = build(:credit, year: "#{(Time.new.year.to_s[2,2].to_i+10).to_s}")
#         expect(credit_card).to be_valid
#       end
#     end

#     context "can not save" do

#       # 登録不可能（authorization_code空欄）
#       it "is invalid without authorization_code" do
#         credit_card = build(:credit, authorization_code: nil)
#         credit_card.valid?
#         expect(credit_card.errors[:authorization_code]).to include("入力してください")
#       end

#       # 登録不可能（security_code空欄）
#       it "is invalid without security_code" do
#         credit_card = build(:credit, security_code: nil)
#         credit_card.valid?
#         expect(credit_card.errors[:security_code]).to include("入力してください")
#       end

#       # 登録不可能（month空欄）
#       it "is invalid without month" do
#         credit_card = build(:credit, month: nil)
#         credit_card.valid?
#         expect(credit_card.errors[:month]).to include("選択して下さい")
#       end

#       # 登録不可能（year空欄）
#       it "is invalid without year" do
#         credit_card = build(:credit, year: nil)
#         credit_card.valid?
#         expect(credit_card.errors[:year]).to include("選択して下さい")
#       end

#       # 登録不可能（user_id空欄）
#       it "is invalid without user_id" do
#         credit_card = build(:credit, user_id: nil)
#         credit_card.valid?
#         expect(credit_card.errors[:user_id]).to include("入力してください")
#       end

#       # 登録不可能（フォーマットエラー・境界値：authorization_code、13桁）
#       it "is invalid with wrong authorization_code(13 characters)" do
#         credit_card = build(:credit, authorization_code: '1234567890123')
#         credit_card.valid?
#         expect(credit_card.errors[:authorization_code]).to include("この番号は登録できません")
#       end

#       # 登録不可能（フォーマットエラー・境界値：authorization_code、17桁）
#       it "is invalid with wrong authorization_code(17 characters)" do
#         credit_card = build(:credit, authorization_code: '12345678901234567')
#         credit_card.valid?
#         expect(credit_card.errors[:authorization_code]).to include("この番号は登録できません")
#       end

#       # 登録不可能（フォーマットエラー・境界値：security_code、2桁）
#       it "is invalid with wrong security_code(2 characters)" do
#         credit_card = build(:credit, security_code: '12')
#         credit_card.valid?
#         expect(credit_card.errors[:security_code]).to include("この番号は登録できません")
#       end

#       # 登録不可能（フォーマットエラー・境界値：security_code、5桁）
#       it "is invalid with wrong security_code(5 characters)" do
#         credit_card = build(:credit, security_code: '12345')
#         credit_card.valid?
#         expect(credit_card.errors[:security_code]).to include("この番号は登録できません")
#       end

#       # 登録不可能（フォーマットエラー・境界値：month、存在しない13月）
#       it "is invalid with wrong month(13)" do
#         credit_card = build(:credit, month: '13')
#         credit_card.valid?
#         expect(credit_card.errors[:month]).to include("無効な選択です")
#       end

#       # 登録不可能（フォーマットエラー・境界値：month、存在しない0月）
#       it "is invalid with wrong month(0)" do
#         credit_card = build(:credit, month: '0')
#         credit_card.valid?
#         expect(credit_card.errors[:month]).to include("無効な選択です")
#       end

#       # 登録不可能（フォーマットエラー・境界値：year、11年後）
#       it "is invalid with wrong year(11 years later)" do
#         credit_card = build(:credit, year: "#{(Time.new.year.to_s[2,2].to_i+11).to_s}")
#         credit_card.valid?
#         expect(credit_card.errors[:year]).to include("無効な選択です")
#       end

#       # 登録不可能（フォーマットエラー・境界値：year、昨年）
#       it "is invalid with wrong year(last year)" do
#         credit_card = build(:credit, year: "#{(Time.new.year.to_s[2,2].to_i-1).to_s}")
#         credit_card.valid?
#         expect(credit_card.errors[:year]).to include("無効な選択です")
#       end
#     end
#   end
# end