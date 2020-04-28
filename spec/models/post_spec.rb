require 'spec_helper'

RSpec.describe Post, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.build(:post)).to be_valid
  end

  it "is invalid without a title" do
    post = FactoryBot.build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).to include("を入力して下さい。")
  end

  it "is invalid length maimum 50 a title" do
    post = FactoryBot.build(:post, title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                                  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")

    post.valid?
    expect(post.errors[:title]).to include("は50文字以内で記入してください。")
  end

  it "is invalid length maximum 140 a discription"  do
    post = FactoryBot.build(:post, discription: "ああああああああああああああああああああ
                                  ああああああああああああああああああああ
                                  ああああああああああああああああああああ
                                  ああああああああああああああああああああ
                                  ああああああああああああああああああああ
                                  ああああああああああああああああああああ
                                  ああああああああああああああああああああ")
    post.valid?
    expect(post.errors[:discription]).to include("は140文字以内で記入してください。")
  end

end
