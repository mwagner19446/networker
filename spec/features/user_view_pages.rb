require 'spec_helper'

describe "a user can view their pages" do 
  let(:user_0) { FactoryGirl.create(:user, :superuser)}
  let(:user_1) { FactoryGirl.create(:user) }

  it "super-user can view the Admin Page"do
    login(user_0)
    visit users_path
    expect(page).to have_content "Admin User Page"
  end 

  it "super-user can view non super-user"do
    login(user_0)
    visit user_path(user_1.id)
    expect(page).to have_content user_1.name
  end

  it "non super-user cannot view the Admin Page"do
    login(user_1)
    visit users_path
    expect(page).to_not have_content "Admin User Page"
  end

  it "non super-user cannot view super-user"do
    login(user_1)
    visit user_path(user_0.id)
    expect(page).to_not have_content user_0.name
  end  


  def login(user)
    visit "/sessions"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

end 