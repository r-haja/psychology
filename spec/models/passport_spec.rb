require 'spec_helper'

RSpec.describe Passport, type: :model do

  it "has valid factory" do
    expect(FactoryBot.build(:passport)).to be_valid
  end

  it "is invalid without a purpose" do
    passport = FactoryBot.build(:passport, purpose: nil)
    passport.valid?
    expect(passport.errors[:purpose]).to include("を設定してください。")
  end

  it "is valid without a goal" do
    passport = FactoryBot.build(:passport, goal: nil)
    passport.valid?
    expect(passport.errors[:goal]).to include("を設定してください。")
  end
end
