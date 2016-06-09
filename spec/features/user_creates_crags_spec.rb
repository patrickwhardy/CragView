require 'rails_helper'

RSpec.feature "User can add a crag" do
  context "with their photospheres" do
    it "gets photospheres" do
      user = create(:user)
      # panorama = create(:panorama)

      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit(dashboard_path(user))

      # click on image
      # fill in crag name with _
      # fill in routes/description/directions
      # click create crag
      # expect current path to be crag#show
      # expect it to have crag data
    end
  end
end
