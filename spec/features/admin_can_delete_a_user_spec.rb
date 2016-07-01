require "rails_helper"

RSpec.feature "admin can delete a user" do
  scenario "They delete from admin user index" do
    admin = create(:user)
    admin.role = 1
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    user = create(:user)

    visit dashboard_path(admin)
    click_on "View All Users"

    expect(current_path).to eq(admin_users_path(admin))
    within(".user-#{user.id}") do
      click_on("Delete")
    end

    expect(page).not_to have_content "#{user.id}"
  end
end
