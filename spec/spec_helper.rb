require 'rubygems'
gem 'rspec', '~> 1.1.3'
require 'spec'

# add lib directory
$:.unshift File.dirname(__FILE__) + '/../lib'

Spec::Runner.configure do |config|
  config.mock_with :mocha
end

require 'google_translate'
include GoogleTranslate


