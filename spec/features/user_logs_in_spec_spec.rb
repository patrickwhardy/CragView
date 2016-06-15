require "spec_helper"
RSpec.feature "User can log in" do
  it "logs them in with google" do
    mock_auth_hash
    user = create(:user)

    visit root_path

    click_on("Sign In To Add Your Views")

    expect(current_path).to eq(dashboard_path(user))
    expect(page).to have_content(user.name)

    expect(page).to have_content("Signed in as #{user.name}!")
  end
end
