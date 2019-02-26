require 'rails_helper'

feature "User creates new event" do
  scenario "successfully" do
    visit root_path
    click_on "Nouvel événement"
  
    pending "scenario of creating a new event"  
  end
end
