require "rails_helper"

RSpec.feature "User can log in" do
  before(:each) do
    mock_auth_hash
  end

  it "logs them in with google" do
    user = create(:user)

    visit root_path

    click_on("Sign In To Add Your Views")

    expect(current_path).to eq(dashboard_path(user))
    expect(page).to have_content(user.name)

    expect(page).to have_content("Signed in as #{user.name}!")
  end

  it "logs out" do
    user = create(:user)

    visit root_path
    click_on("Sign In To Add Your Views")

    click_on("Sign Out")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sign In To Add Your Views")
  end
end
