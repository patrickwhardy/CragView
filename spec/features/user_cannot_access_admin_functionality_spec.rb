require "rails_helper"

RSpec.feature "admin can delete a crag" do
  scenario "They delete or update from admin crag index" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit dashboard_path(user)
    expect(page).not_to have_content("View All Crags")

    visit admin_crags_path(user)
    expect(current_path).to eq(root_path)
  end
end
