require "spec_helper"
RSpec.feature "User can log in" do
  it "logs them in with google" do
    user = create(:user)

    visit root_path

    click_on("Sign In To Add Your Views")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    #no route matches [GET] "/o/oauth2/auth"????
    expect(current_path).to eq(dashboard_path(user))
    expect(page).to have_content(user.name)
  end
end
