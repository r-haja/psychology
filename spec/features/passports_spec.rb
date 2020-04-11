require 'rails_helper'

RSpec.feature "Passports", type: :feature do
  scenario "user create a new passport" do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "サインインする"

    expect{
      click_link "パスポート"
      fill_in "目的を記載", with: "Test Purpose"
      fill_in "目標を記載", with: "Test Goal"
      attach_file "ファイルを選択", file_fixture("test.png")
      click_button "作成する"

      expect(page).to have_content "習慣化パスポートを保存しました！"
      expect(page).to have_content "Test Purpose"
      expect(page).to have_content "Test Goal"
      #expect(user.passports.passport_image).to be_truthy
      expect(page).to have_content user.name
    }.to change(user.passports, :count).by(1)
  end
end
