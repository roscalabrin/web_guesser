require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess, number)
  'Take a guess'
  if guess.nil?
    "Take a guess"
  elsif guess.to_i > number + 5 && guess.to_i <= 100
    "Way too high"
    "take a guess"
  elsif guess.to_i > number && guess.to_i <= 100
    "High"
  elsif guess.to_i == number
    'Correct'
  elsif guess.to_i < number - 5 && guess.to_i >= 0
    "wayt to low"
  elsif guess.to_i < number && guess.to_i >= 0
    "low"
  else
    "invalid"
  end

end
