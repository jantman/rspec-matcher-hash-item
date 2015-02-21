require 'spec_helper'
require 'rspec_matcher_hash_item'

describe '#have_hash_item_matching' do
  context 'overall' do
    it "is diffable" do
      expect(have_hash_item_matching('fookey', /fooval/)).to be_diffable
    end
    it "has the correct description" do
      matcher = have_hash_item_matching('fookey', /fooval/)
      matcher.matches?({'bar' => 'baz', 'bazkey' => 'fooval'})
      expect(matcher.description).to eq "include key 'fookey' matching /fooval/"
    end
  end
  context '.should' do
    context 'when key is missing' do
      it 'fails' do
        matcher = have_hash_item_matching('fookey', /fooval/)
        expect(matcher.matches?({'bar' => 'baz', 'bazkey' => 'fooval'})).to eq false
      end
      it "has the correct failure message" do
        matcher = have_hash_item_matching('fookey', /fooval/)
        matcher.matches?({'bar' => 'baz', 'bazkey' => 'fooval'})
        expect(matcher.failure_message).to eq "expected that hash would include key 'fookey' matching /fooval/ but key 'fookey' is not present in hash."
      end
      it "fails with correct error" do
        expected_fail = /expected that hash would include key 'fookey' matching \/fooval\/ but key 'fookey' is not present in hash.+-\["fookey", \/fooval\/\]/m
        expect {
          expect({'bar' => 'baz', 'bazkey' => 'fooval'}).to have_hash_item_matching('fookey', /fooval/)
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
      end
    end
    context 'when value doesnt match' do
      it 'fails' do
        matcher = have_hash_item_matching('fookey', /fooval/)
        expect(matcher.matches?({'bar' => 'baz', 'fookey' => 'foonotval'})).to eq false
      end
      it "has the correct failure message" do
        matcher = have_hash_item_matching('fookey', /fooval/)
        matcher.matches?({'bar' => 'baz', 'fookey' => 'foonotval'})
        expect(matcher.failure_message).to eq "expected that hash[fookey] would match /fooval/"
      end
      it "fails with correct error" do
        expected_fail = /expected that hash\[fookey\] would match \/fooval\/.+-\["fookey", \/fooval\/\]/m
        expect {
          expect({'bar' => 'baz', 'fookey' => 'foonotval'}).to have_hash_item_matching('fookey', /fooval/)
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
      end
    end
    context 'when value matches' do
      it 'succeeds' do
        matcher = have_hash_item_matching('fookey', /fooval/)
        expect(matcher.matches?({'bar' => 'baz', 'fookey' => 'fooval'})).to eq true
      end
    end
  end
  context '.should_not' do
    context 'when key is missing' do
      it 'succeeds' do
        matcher = have_hash_item_matching('fookey', /fooval/)
        expect(matcher.does_not_match?({'bar' => 'baz', 'bazkey' => 'fooval'})).to eq true
      end
    end
    context 'when value matches' do
      it "fails with correct error" do
        expected_fail = /expected that hash\[fookey\] would not match \/fooval\/.+-\["fookey/m
        expect {
          expect({'bar' => 'baz', 'fookey' => 'fooval'}).not_to have_hash_item_matching('fookey', /fooval/)
        }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
      end
    end
    context 'when value does not match' do
      it 'succeeds' do
        expect {
          expect({'bar' => 'baz', 'fookey' => 'fooval'}).not_to have_hash_item_matching('fookey', /barbaz/)
        }.not_to raise_error
      end
    end
  end
end
