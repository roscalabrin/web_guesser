require 'sinatra'
require 'sinatra/reloader'

  SECRET_NUMBER = rand(100)
  @@guess_counter = 5

get '/' do
  guess = params["guess"]
  number = SECRET_NUMBER
  message = check_guess(guess, number)
  color = @color
  guess_counter = @@guess_counter
  guess_available = calculate_guesses_available(guess_counter)
  erb :index, :locals => {:number => number, :message => message, :color => color, :guess_available => guess_available, :guess_counter => guess_counter}
end

def check_guess(guess, number)
  if @@guess_counter <= 1 
    "The SECRET NUMBER was #{number}"
  else
    if guess.nil?
      "Take a guess!"
    elsif guess.to_i > number + 5 && guess.to_i <= 100
      way_high
    elsif guess.to_i > number && guess.to_i <= 100
      high
    elsif guess.to_i == number
      correct(number)
    elsif guess.to_i < number - 5 && guess.to_i >= 0
      way_low
    elsif guess.to_i < number && guess.to_i >= 0
      low
    else
      invalid_guess
    end
  end
end

def calculate_guesses_available(guess_counter)
  "You have #{@@guess_counter} guesses left."
end

def invalid_guess
  @@guess_counter -= 1
  @color = '#fff'
  "Invalid guess. Please guess a number between 0-100."
end

def way_high
  @@guess_counter -= 1
  @color = '#ff0000'
  "Way too high!"
end

def high
  @@guess_counter -= 1
  @color = '#ff8888'
  "Too high!"
end

def low
  @@guess_counter -= 1
  @color = '#ff8888'
  "Too low!"
end

def way_low
  @@guess_counter -= 1
  @color = '#ff0000'
  "Way too low!"
end

def correct(number)
  @@guess_counter -= 1
  @color ='#008b00'
  "You got it right!\nThe SECRET NUMBER is #{number}"
end
