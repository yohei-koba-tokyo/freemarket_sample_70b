require 'rails_helper'

describe Item do 
  describe '#create' do

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a explanation" do
      item = build(:item, explanation: nil)
      item.valid?
      expect(item.errors[:explanation]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without a postage" do
      item = build(:item, postage: nil)
      item.valid?
      expect(item.errors[:postage]).to include("can't be blank")
    end

    it "is invalid without an area" do
      item = build(:item, area: nil)
      item.valid?
      expect(item.errors[:area]).to include("can't be blank")
    end

    it "is invalid without a day" do
      item = build(:item, day: nil)
      item.valid?
      expect(item.errors[:day]).to include("can't be blank")
    end
    
  end
end
