require 'spec_helper'

RSpec.describe Psychology, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:psychology)).to be_valid
  end

  it "is invalid without a title" do
    psychology = FactoryBot.build(:psychology, title: nil)
    psychology.valid?
    expect(psychology.errors[:title]).to include("を入力してください。")
  end

  it "is valid without a discription" do
    psychology = FactoryBot.build(:psychology, discription: nil)
    psychology.valid?
    expect(psychology.errors[:discription]).to include("を入力してください。")
  end
end
