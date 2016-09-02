require 'spec_helper'

describe WordStemming::Dictionary do
  subject(:dictionary) { WordStemming::Dictionary.new("auto and truck repair, auto-repair for automobiles") }

  it 'creates a dicitionary when initializing' do
    expect(dictionary.dictionary).not_to be_empty
  end

  it 'should not pick words from the stop words list' do
    expect(dictionary.dictionary.keys).not_to include 'and'
    expect(dictionary.dictionary.keys).not_to include 'for'
  end

  it 'should have a high match score for matching descriptions' do
    description = "automobile and truck auto-repair"
    expect(dictionary.match_score(description)).to be > 80
  end

  it 'should have a low match score for un-matching descriptions' do
    description = "automobile toy tracks"
    expect(dictionary.match_score(description)).to be < 20
  end
end
