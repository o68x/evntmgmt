require 'rails_helper'

feature "User logs in" do
  scenario "successfully" do
    @user = FactoryBot.build(:user, email: "adminevent@yopmail.com", password: "password", id: "21")
    sign_in @user
    visit root_path
    expect(page).to have_css 'button', text: "adminevent@yopmail.com"
  end  
end
