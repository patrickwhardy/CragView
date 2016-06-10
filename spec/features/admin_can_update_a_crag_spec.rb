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
      click_on("Edit")
    end
    expect(current_path).to eq(edit_admin_crag_path(crag))
    fill_in crag.name, with: "New Name"
    fill_in crag.description, with: "New Description"
    fill_in crag.directions, with: "New Directions"
    click_on("Update Crag")

    expect(current_path).to eq(admin_crags_path(admin))
    expect(page).to have_content "New Name"
  end
end
