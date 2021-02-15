require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = []
    10.times do
      @letters.push(("A".."Z").to_a.sample)
    end
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_serialized = open(url).read
    word = JSON.parse(word_serialized)
    # unless params[:word].blank?
      comparison = params[:word].chars.all? { |letter| params[:word].upcase.count(letter.upcase) <= params[:letters].split.count(letter.upcase) }
      if word["found"] && comparison
        @score="Congratulations ! #{params[:word].upcase} is a valid word"
      elsif word["found"] == false
        @score="Sorry but #{params[:word].upcase} doesn't seem to be a valid English word"
      else
        @score="Sorry but #{params[:word].upcase} can't be built out of #{params[:letters]} "
      end
    # end
  end

  # def match_the_grid
  # @word_array = @word.split(//)
  # @word_array.each do |letter|
  #   if @letters.include?(letter)

  #   end
end
