#require 'coveralls'
#Coveralls.wear!

#require 'simplecov'

#SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
#  SimpleCov::Formatter::HTMLFormatter,
#  Coveralls::SimpleCov::Formatter
#]
#SimpleCov.start do
#  add_filter '.bundle/'
#end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
SimpleCov.start do
  add_filter "/vendor/"
end

require 'codecov'
if ENV['CI']=='true'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'rspec_matcher_hash_item'
