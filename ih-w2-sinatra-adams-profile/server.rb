require "sinatra"
require "sinatra/reloader" if development?
enable(:sessions)

login_information = [
	{:user => "Adam", :pass => "Noah"},
	{:user => "Priscilla", :pass => "Ava"},
	{:user => "Gaby", :pass => "Luca"}
]

get "/login" do
	erb(:login)
end

post "/process_login" do
	user = params[:username]
	pass = params[:password]

	matched_user = nil
	
	login_information.each do | cred |
		if user == cred[:user] && pass == cred[:pass]
			matched_user = cred
		end
	end

	if matched_user != nil
		session[:current_user] = matched_user
		redirect to("/profile")
	else
		redirect to ("/login")
	end
end

get "/profile" do
	if session[:current_user] != nil
		@name = session[:current_user]
		erb(:profile)
	else
		redirect to("/login")
	end
end


