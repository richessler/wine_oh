require 'spec_helper'

describe "a user can create an account" do

  let(:user) { FactoryGirl.create(:user) }

  context "user can navigate" do
    it "can set up account with info" do
      visit root_path
      click_link('Sign up')
      fill_in "First name", with: "Richard"
      fill_in "Last name", with: "Hessler"
      select "21", from: "Age"
      fill_in "Email", with: "Richard@rIcHaRd.com"
      fill_in "Password", with: "password"
      fill_in "Confirm Password", with: "password"
    end
  end
end
