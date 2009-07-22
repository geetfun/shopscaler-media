# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "haml"
  config.gem "pg"
  config.gem "aws-s3", :lib => "aws/s3"
  config.gem "thoughtbot-paperclip", :lib => "paperclip"
  config.gem "rubyist-aasm", :lib => "aasm"
  config.time_zone = 'UTC'
end