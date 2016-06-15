require 'rails_helper'

RSpec.describe Crag, type: :model do
  it { should validate_presence_of :location }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :directions }

  it "has name, description, directions and location" do
    crag = create(:crag)

    expect(crag.name).to eq("The Big Mountain")
    expect(crag.description).to eq("It's a really big mountain with a lot of rocks.")
    expect(crag.directions).to eq("Drive a few miles to a pullout and hike up there")
    expect(crag.location).to eq("40.0132937,-105.3091995")
  end
end
