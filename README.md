# RspecMatcherHashItem

This gem provides some rspec matchers to simplify assertions about
the internal state of has hobjects.

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

1. Fork it ( https://github.com/[my-github-username]/rspec-matcher-hash-item/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
