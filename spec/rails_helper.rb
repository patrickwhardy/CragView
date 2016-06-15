# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'capybara/rails'
require 'rspec/rails'
require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.mock_with :mocha
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.use_transactional_fixtures = true
  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

OmniAuth.config.test_mode = true

def mock_auth_hash
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    "uid" => "109924137147373805722",
    "provider" => "google_oauth2",
    "credentials" => { "expires_at" => "04/03/2019",
    "oauth_token" => "ya29.Ci8AAwZpwsYj3OXO-Y3k3GZriFNshS6xNurw5wwafFrGrEMm1fQOeexX54KNfKrGcA"
      },
    "info" => {"name" => "Patrick Hardy",
      "image" => "https://lh3.googleusercontent.com/-877gHIubnP0/AAAAAAAAAAI/AAAAAAAAABY/KonHIUOAUVo/photo.jpg"
      }
    })
end
