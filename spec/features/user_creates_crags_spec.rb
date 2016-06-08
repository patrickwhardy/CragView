require 'rails_helper'

RSpec.feature "User can add a crag" do
  context "with their photospheres" do
    it "gets photospheres" do
      user = create(:user)
      ApplicationController.any_instance.stubs(:current_user).returns(user)


    end
  end
end
