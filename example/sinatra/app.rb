require "sinatra"
require "omniauth"
require "omniauth-tailscale"

# magic to make tailscale function - no POST required
OmniAuth.config.allowed_request_methods << :get
OmniAuth.config.silence_get_warning = true

enable :sessions

# /auth/developer kicks this off?
use OmniAuth::Strategies::Tailscale

get "/" do
  unless session[:user]
    redirect "/auth/tailscale"
  end

  "Woa, black betty. Hello #{session[:user][:name]}"
end

get "/logout" do
  session.clear

  redirect "/"
end

get "/auth/tailscale/callback" do
  p request.env["omniauth.auth"]

  session[:user] = {
    name: request.env["omniauth.auth"].info[:display_name]
  }

  redirect "/"
end
