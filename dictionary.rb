require 'active_support/inflector'
require 'fast_stemmer'

class Dictionary
  attr_accessor :text, :stems, :dictionary

  def initialize(text = "")
    @text = text
    @stems = get_stems(text)
    @dictionary = get_dictionary
  end

  def match(description)
    "#{score(description) * 100 / max_score}% match"
  end

  def add_to_dictionary(description)
    @stems += get_stems(description)
    @dictionary = get_dictionary
  end

  private
    def get_stems(text)
      return [] unless text.length > 0

      stop_words = File.readlines('stopwords.txt').map(&:strip)

      ActiveSupport::Inflector.transliterate(text).
        downcase.
        to_s.
        gsub(/[._:;'"`,?|+={}()!@#%^&*<>~\$\-\\\/\[\]\d+]/, ' '). # strip punctuation
        gsub(/[^\s\p{Alnum}]/,''). # strip accents
        split(' ').
        reject { |word| word.size <= 2 || stop_words.include?(word) }.
        map(&:stem)
    end

    def get_dictionary
      return {} unless self.stems.length > 0

      stems = self.stems.
        inject(Hash.new(0)) {|h,i| h[i] += 1; h }.
        reject { |word, occurrences| occurrences < 2 }.
        sort_by { |word, occurrences| occurrences }.reverse.to_h

      max_stem_count = stems.values.first
      stems.inject({}) do |a, stem|
        score = (10.0 * stem.last / max_stem_count).round
        a.merge!({ stem.first => score / 2 }) if score > 1
        a
      end
    end

    def score(description)
      uniq_stems = get_stems(description).uniq
      uniq_stems.inject(0) do |a, stem|
        if dictionary[stem]
          a += dictionary[stem]
        end
        a
      end
    end

    def max_score
      dictionary.values.inject(0) {|sum, i| sum + i }
    end
end
