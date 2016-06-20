require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  number = SECRET_NUMBER
  message = check_guess(guess, number)
  color = @color
  erb :index, :locals => {:number => number, :message => message, :color => color}
end

def check_guess(guess, number)
  if guess.nil?
    "Take a guess"
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

def invalid_guess
  @color = '#fff'
  "Invalid guess. Please guess a number between 0-100."
end

def way_high
  @color = '#ff0000'
  "Way too high!"
end

def high
  @color = '#ff8888'
  "Too high!"
end

def low
  @color = '#ff8888'
  "Too low!"
end

def way_low
  @color = '#ff0000'
  "Way Too low!"
end

def correct(number)
  @color ='#008b00'
  "You got it right!\nThe SECRET NUMBER is #{number}"
end
