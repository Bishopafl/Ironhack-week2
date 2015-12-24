require "sinatra"
require "sinatra/reloader" if development?

enable(:sessions)

get "/add" do
  erb(:add)
end

get "/subtract" do
	erb(:subtract)
end

get "/multiply" do
	erb(:multiply)
end

get "/divide" do
  erb(:divide)
end

get "/foo" do
  status(418)
  "I'm a tea pot!"
end

post "/calculate_add" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  result = first + second
  "#{first} + #{second} = #{result}"
end

post "/calculate_subtract" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  result = first - second
  "#{first} - #{second} = #{result}"
end

post "/calculate_multiply" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  result = first * second
  "#{first} * #{second} = #{result}"
end

post "/calculate_divide" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  result = first / second
  "#{first} / #{second} = #{result}"
end