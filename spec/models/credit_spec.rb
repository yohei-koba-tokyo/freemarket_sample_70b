require 'rails_helper'
# RSpec.describe Credit, do

describe Credit do
  describe '#create'do

    it "can save" do
      credit = build(:credit)
      expect(credit).to be_valid
    end



  end
end
