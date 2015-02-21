require "rspec_matcher_hash_item"

RSpec::Matchers.define :have_hash_item_matching do |key, val_regex|
  match do |actual|
    if not actual.has_key?(key)
      false
    else
      expect(actual[key]).to match val_regex
    end
  end
  match_when_negated do |actual|
    if not actual.has_key?(key)
      true
    else
      actual[key] !~ val_regex
    end
  end
  failure_message do |actual|
    if not actual.has_key?(key)
      "expected that hash would include key '#{key}' matching /#{val_regex.source}/ but key '#{key}' is not present in hash."
    else
      "expected that hash[#{key}] would match /#{val_regex.source}/"
    end
  end
  failure_message_when_negated do |actual|
    "expected that hash[#{key}] would not match /#{val_regex.source}/"
  end
  description do
    "include key '#{key}' matching /#{val_regex.source}/"
  end

  diffable
end
