require 'active_support/inflector'
require 'fast_stemmer'

class Dictionary
  attr_accessor :text, :dictionary

  def initialize(text)
    @text = text
    @dictionary = scores(text)
  end

  def stems(text)
    stop_words = File.readlines('stopwords.txt').map(&:strip)

    ActiveSupport::Inflector.transliterate(text).
      downcase.
      to_s.
      gsub(/[._:;'"`,?|+={}()!@#%^&*<>~\$\-\\\/\[\]\d+]/, ' '). # strip punctuation
      gsub(/[^\s\p{Alnum}]/,''). # strip accents
      split(' ').
      reject { |word| word.size <= 2 || stop_words.include?(word) }.
      map(&:stem).
      inject(Hash.new(0)) {|h,i| h[i] += 1; h }.
      sort_by { |word, occurrences| occurrences }.to_h
  end

  def scores(text)
    stems = stems(text)
    max_stem_count = stems.to_a.last.last
    stems.inject({}) do |a, stem|
      score = (10.0 * stem.last / max_stem_count).round
      a.merge!({ stem.first => score }) if score > 0
      a
    end
  end
end