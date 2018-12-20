require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# require 'support/factory_bot'
require 'webmock/rspec'

VCR.configure do |config|
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<YNAB_API_KEY>") { ENV['YNAB_API_KEY'] }
  config.filter_sensitive_data("<YNAB_BUDGET_ID>") { ENV['YNAB_BUDGET_ID'] }
  config.filter_sensitive_data("<GOOGLE_API_KEY>") { ENV['GOOGLE_API_KEY'] }
  config.filter_sensitive_data("<TWILIO_ACCOUNT_SID>") { ENV['TWILIO_ACCOUNT_SID'] }
  config.filter_sensitive_data("<TWILIO_AUTH_TOKEN>") { ENV['TWILIO_AUTH_TOKEN'] }
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Shoulda::Matchers.configure do |config|
    config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

SimpleCov.start "rails" do
  add_filter "app/channels/application_cable/channel.rb"
  add_filter "app/channels/application_cable/connection.rb"
  add_filter "app/helpers/application_helper.rb"
  add_filter "app/jobs/application_job.rb"
  add_filter "app/mailers/application_mailer.rb"
end


RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryBot::Syntax::Methods

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

end

def stub_twilio_api
  stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/AC119493e137c10b2df84ea1a54bb7fc10/Messages.json").to_return(body: File.read("./spec/fixtures/twilio_response.json"))

end
