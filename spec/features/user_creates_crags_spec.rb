require 'rails_helper'

RSpec.feature "User can add a crag" do
  context "with their photospheres" do
    it "gets photospheres" do
      user = create(:user)
      XMLParser.create_users_panoramas(user.uid)
      panorama = user.panoramas.last
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit(dashboard_path(user))

      click_on(panorama.location)

      expect(current_path).to eq(new_crags_path)

      fill_in "Name", with: "Practice Rock"
      fill_in "Description", with: "A great place to learn the ropes."
      fill_in "Directions", with: "Drive west from Boulder until you see some big rocks."

      click_on "Create Crag"

      expect(current_path).to eq(crags_path(Crag.last))

      expect(page).to have_content("Practice Rock")
      expect(page).to have_content("A great place to learn the ropes.")
      expect(page).to have_content("Drive west from Boulder until you see some big rocks.")
    end
  end
end
