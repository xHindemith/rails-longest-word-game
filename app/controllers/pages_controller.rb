require "json"
require "open-uri"

class PagesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @total = 0
    @new = params[:new]
    @game_letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@new}"
    user_serialized = URI.open(url).read
    data = JSON.parse(user_serialized)

    if data['found'] && letters_used?(@new, @game_letters)
      @result = "Congratulations! #{@new} is a real word"
      @total += @new.length
    else
      @result = "Dohhh! #{@new} unfortunately is not a word"
    end
  end

  def letters_used?(word, letters)
    word_chars = word.upcase.chars
    letters_chars = letters.upcase.chars

    word_chars.all? { |letter| letters_chars.include?(letter) }
  end
end
