require 'rails_helper'
describe Credit do
  describe '#create'do
    it "can save" do
      credit = build(:credit)
      expect(credit).to be_valid
    end
  end
end
