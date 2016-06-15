require 'rails_helper'

RSpec.feature "User can add a crag" do
  context "with their photospheres" do
    it "gets photospheres" do
      panorama = create(:panorama)
      user = panorama.user

      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit(dashboard_path(user))

      find(".thumbnail-#{panorama.id}").click

      expect(current_path).to eq(new_crag_path)

      fill_in "Name", with: "Practice Rock"
      fill_in "Description", with: "A great place to learn the ropes."
      fill_in "Directions", with: "Drive west from Boulder until you see some big rocks."

      click_on "Create Crag"
      expect(current_path).to eq(crags_path(Crag.last))

      expect(page).to have_content("Practice Rock")
      expect(page).to have_content("A great place to learn the ropes.")
    end

    it "using locator" do
      user = create(:user)

      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit(dashboard_path(user))
      click_link("here")

      expect(current_path).to eq(locator_path)

      fill_in "Name", with: "New Crag Name"
      fill_in "Description", with: "New Crag Description"
      fill_in "Directions", with: "New Crag Directions"
      click_button("Create Crag")
    end
  end
end
