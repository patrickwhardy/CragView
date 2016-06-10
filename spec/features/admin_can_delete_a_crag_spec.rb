require "rails_helper"

RSpec.feature "admin can delete a crag" do
  scenario "They delete from admin crag index" do
    admin = create(:user)
    admin.role = 1
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    crag = create(:crag)

    visit dashboard_path(admin)
    click_on "View All Crags"

    expect(current_path).to eq(admin_crags_path(admin))
    within(".crag-#{crag.id}") do
      click_on("Delete")
    end
    # expect(page).not_to have_content table row ".crag-#{crag.id}"
    expect(page).to have_content "#{crag.name} has been deleted"
  end
end
