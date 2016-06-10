FactoryGirl.define do
  factory :user do
    provider "google_oauth2"
    uid "109924137147373805722"
    name Faker::Name.name
    profile_image "https://lh3.googleusercontent.com/-877gHIubnP0/AAAAAAAAAAI/AAAAAAAAABY/KonHIUOAUVo/photo.jpg"
  end

  # factory :admin do
  #   provider "google_oauth2"
  #   uid "109924137147373805722"
  #   name Faker::Name.name
  #   profile_image "https://lh3.googleusercontent.com/-877gHIubnP0/AAAAAAAAAAI/AAAAAAAAABY/KonHIUOAUVo/photo.jpg"
  #   role 1
  # end
end
