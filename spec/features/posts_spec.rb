require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "user create a new post" do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "サインイン"

    expect{
      find(".navbar-toggler").click
      click_link "投稿"
      fill_in "タイトルを記載", with: "test_title"
      fill_in "詳細を記載", with: "test_discription"
      attach_file "ファイルを選択", file_fixture("test.png")
      click_button "投稿する"

      expect(page).have_content "投稿しました！"
      expect(page).have_content "test_title"
      expect(page).have_content "test_discription"
      expect(user.post.photos.first.post_image?).to be_truthy
      expect(page).have_content user.name
    }
  end
end
