require 'domain_finder'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options[:record] = :new_episodes
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true

  c.expect_with :rspec do |c|
    c.syntax = :expect
  end
end