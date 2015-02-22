# RspecMatcherHashItem

[![Build Status](https://travis-ci.org/jantman/rspec-matcher-hash-item.svg?branch=master)](https://travis-ci.org/jantman/rspec-matcher-hash-item)
[![Code Coverage](https://codecov.io/github/jantman/rspec-matcher-hash-item/coverage.svg?branch=master)](https://codecov.io/github/jantman/rspec-matcher-hash-item?branch=master)
[![Code Climate](https://codeclimate.com/github/jantman/rspec-matcher-hash-item/badges/gpa.svg)](https://codeclimate.com/github/jantman/rspec-matcher-hash-item)
[![Gem Version](https://img.shields.io/gem/v/rspec-matcher-hash-item.svg)](https://rubygems.org/gems/rspec-matcher-hash-item)
[![Total Downloads](https://img.shields.io/gem/dt/rspec-matcher-hash-item.svg)](https://rubygems.org/gems/rspec-matcher-hash-item)
[![Github Issues](https://img.shields.io/github/issues/jantman/rspec-matcher-hash-item.svg)](https://github.com/jantman/rspec-matcher-hash-item/issues)
[![Project Status: Abandoned - Initial development has started, but there has not yet been a stable, usable release; the project has been abandoned and the author(s) do not intend on continuing development.](http://www.repostatus.org/badges/0.1.0/abandoned.svg)](http://www.repostatus.org/#abandoned)

This gem provides some rspec matchers to simplify assertions about
the internal state of has hobjects.

# Do Not Use This

Well, this is embarassing. A few hours _after_ I published a blog post about this, I received a
[comment](http://blog.jasonantman.com/2015/02/rspec-matcher-for-hash-item-value/#comment-1868422853)
from [@myronmarston](https://twitter.com/myronmarston). I'd originally
written this matcher for RSpec2, and then had to convert my project to use
RSpec3. I just blindly converted this matcher over. Myron pointed out that with
RSpec3's [composable matchers](http://rspec.info/blog/2014/01/new-in-rspec-3-composable-matchers/),
the functionality of this gem is built-in. It can be done as simply as:

~~~~{.ruby}
its(:headers) { should include('server' => /nginx\/1\./) }
~~~~

__As such, I've yanked them gem and am leaving the code and blog post here just for posterity.__
This should probably not be used.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-matcher-hash-item'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-matcher-hash-item

## Usage

In your spec_helper, add a line like:

    require 'rspec_matcher_hash_item'

### Matchers

#### have_hash_item_matching

This matcher tests that the given hash has a specified key, with a
value matching a regex.

    expect(my_hash).to have_hash_item_matching('keyname', /regex/)

## Contributing

1. Fork it ( https://github.com/jantman/rspec-matcher-hash-item/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Testing

Spec tests are done automatically via Travis CI. They're run using Bundler and rspec.

For manual testing:

    bundle install
    bundle exec rake spec

## Releasing

1. Ensure all tests are passing, coverage is acceptable, etc.
2. Increment the version number in ``lib/rspec_matcher_hash_item/version.rb``
3. Update CHANGES.md
4. Push those changes to origin.
5. ``bundle exec rake build``
6. ``bundle exec rake release``
