VCR.configure do |config|
  config.cassette_library_dir = "#{::Rails.root}/spec/cassettes"
  config.hook_into :webmock
  config.ignore_localhost = true
  # uncomment the line below to re-record cassettes
  # config.default_cassette_options = { :record => :new_episodes }
  config.configure_rspec_metadata!
end
