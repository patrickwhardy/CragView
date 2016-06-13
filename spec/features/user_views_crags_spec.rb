require "rails_helper"

RSpec.feature "user can view all crags" do
  it "goes from landing to show" do
    crag = create(:crag)

    visit "/"

    click_on "View All Crag Views"

    expect(current_path).to eq("/crags")

    click_on(crag.name)

    expect(current_path).to eq("/crags/#{crag.id}")

    expect(page).to have_content(crag.name)
    expect(page).to have_content(crag.description)
    expect(page).to have_content(crag.directions)
  end
end
