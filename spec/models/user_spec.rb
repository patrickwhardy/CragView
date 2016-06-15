require 'rails_helper'

RSpec.describe User, type: :model do
  it "gets data from_omniauth" do
    auth_info = OpenStruct.new({"provider"=>"google_oauth2",
     "uid"=>"109924137147373805722",
     "info"=>
      OpenStruct.new({"name"=>"Patrick Hardy",
       "email"=>"patrickwhardy@gmail.com",
       "first_name"=>"Patrick",
       "last_name"=>"Hardy",
       "image"=>"https://lh3.googleusercontent.com/-877gHIubnP0/AAAAAAAAAAI/AAAAAAAAABY/KonHIUOAUVo/photo.jpg",
       "urls"=>{"Google"=>"https://plus.google.com/109924137147373805722"}}),
     "credentials"=>
      OpenStruct.new({"token"=>"ya29.CjD7AmhbCYIoaXU7JZ6uRsTymczbrk2yqblV4Ga8jROOoXsHbhrEJdeAf3plXcpihdw", "expires_at"=>1465411628, "expires"=>true}),
     "extra"=>
      {"id_token"=>
        "eyJhbGciOiJSUzI1NiIsImtpZCI6ImVkZDg1MjBmYmYyZDBkYWYyMWU1YjcwNTVlZWQzYzJmZTA0ZjE3NWEifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXRfaGFzaCI6InRuUFBxVU1tTWtpdjdJTWF1a0s4VmciLCJhdWQiOiI1MTQ0ODkxNzU3MzUtdmdnZHJpZjIwZmZ1aTRzcW01NWltbzhyYzI5MzNtZ24uYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDk5MjQxMzcxNDczNzM4MDU3MjIiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXpwIjoiNTE0NDg5MTc1NzM1LXZnZ2RyaWYyMGZmdWk0c3FtNTVpbW84cmMyOTMzbWduLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiZW1haWwiOiJwYXRyaWNrd2hhcmR5QGdtYWlsLmNvbSIsImlhdCI6MTQ2NTQwODAyOCwiZXhwIjoxNDY1NDExNjI4fQ.s7_F8FIvgq0hw0fywWMWviFAZ35t2D02I9uHyvDEqebSRCftOgmbOU1FbfhOAchNk7iF2PPmvBklrXNLn60-eUBGraloXnTZ85eULs-srRBWNIlooTULA5wgdE-1Dtj2YIj6jdE_5uFNbBPP_xmFicYKiqquuKiEwZfIgNdZKaFNXYXGWk-0aesRJLgYqtwHKmKCGrkdl4X4GbpbXMWsMjDB6yfbLr2EwVfbglTh7zXAXVLE8ddf_P-18YpQHQU42W6DcvqGRU8Nzzm7SELPIz-M0dzXbZVtWYJazCKH_dooXdVbwcLGeUtb2-GdNn8-5-dpeYcAkzrbncpUdBhkXw",
       "id_info"=>
        {"iss"=>"accounts.google.com",
         "at_hash"=>"tnPPqUMmMkiv7IMaukK8Vg",
         "aud"=>"514489175735-vggdrif20ffui4sqm55imo8rc2933mgn.apps.googleusercontent.com",
         "sub"=>"109924137147373805722",
         "email_verified"=>true,
         "azp"=>"514489175735-vggdrif20ffui4sqm55imo8rc2933mgn.apps.googleusercontent.com",
         "email"=>"patrickwhardy@gmail.com",
         "iat"=>1465408028,
         "exp"=>1465411628},
       "raw_info"=>
        {"kind"=>"plus#personOpenIdConnect",
         "gender"=>"male",
         "sub"=>"109924137147373805722",
         "name"=>"Patrick Hardy",
         "given_name"=>"Patrick",
         "family_name"=>"Hardy",
         "profile"=>"https://plus.google.com/109924137147373805722",
         "picture"=>"https://lh3.googleusercontent.com/-877gHIubnP0/AAAAAAAAAAI/AAAAAAAAABY/KonHIUOAUVo/photo.jpg?sz=50",
         "email"=>"patrickwhardy@gmail.com",
         "email_verified"=>"true",
         "locale"=>"en"}}})

    user = User.from_omniauth(auth_info)
    expect(user.uid).to eq("109924137147373805722")
    expect(user.provider).to eq("google_oauth2")
    expect(user.oauth_token).to eq("ya29.CjD7AmhbCYIoaXU7JZ6uRsTymczbrk2yqblV4Ga8jROOoXsHbhrEJdeAf3plXcpihdw")
    expect(user.profile_image).to eq("https://lh3.googleusercontent.com/-877gHIubnP0/AAAAAAAAAAI/AAAAAAAAABY/KonHIUOAUVo/photo.jpg")
    expect(user.role).to eq(0)
  end
end
