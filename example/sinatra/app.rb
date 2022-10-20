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
  "Woa, black betty"
end

get "/auth/tailscale/callback" do
  p request.env["omniauth.auth"]

  "Holy fuckballs"
end
