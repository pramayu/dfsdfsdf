class SearchSuggestion < ApplicationRecord
	def self.terms_for(prefix)
    	$redis.zrevrange("search-suggestion:#{prefix.downcase}", 0, 9)
  	end

  	def self.index_books
	  Book.find_each do |book|
	    index_term(book.title)
	    book.title.split.each { |term| index_term(term) }
	  end
	end

	def self.index_term(term)
	  1.upto(term.length - 1) do |n|
	    prefix = term[0, n]
	    $redis.zincrby("search-suggestion:#{prefix.downcase}", 1, term.downcase)
	  end
	end
end
