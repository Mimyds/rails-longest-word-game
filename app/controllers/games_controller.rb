require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
#   TODO: generate random grid of letters
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    attempt = params[:word]
    @answer = ["Sorry but #{attempt} can't be built out of #{letters}",
                "Sorry but #{attempt} does not seem to be a valid English word...",
                "Congratulations ! #{attempt.upper} is a valid Englih word!"]
    if word_grid(attempt) != true
      @answer = @answer[0]
    elsif parse(attempt) != true
      @answer = @answer[1]
    else
      @answer = @answer[2]
    end
  end

  def word_grid(attempt)
    word = attempt.split("")
    word.include?(@letters)
  end

  def parse(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    #dictionary = URI.open(url).read
    # dictionary = JSON.parse(url)
    # check = check[:words_found]

  end
end
