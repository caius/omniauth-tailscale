require "sinatra"
require "omniauth"
require "omniauth-tailscale"

OmniAuth.config.on_failure = ->(env) do
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
end

enable :sessions

use OmniAuth::Builder do
  provider :tailscale
end

get "/auth/:provider/callback" do
  auth_info = request.env["omniauth.auth"]
  p auth_info

  session[:user] = {
    login_name: auth_info.dig("info", "login_name"),
    display_name: auth_info.dig("info", "display_name")
  }
end

get "/" do
  unless session[:user]
    redirect "/auth/tailscale"
    return
  end

  erb :dashboard
end

__END__

@@ dashboard
<html>
  <body>
    <h1>Hello <%= session[:user][:display_name] %></h1>

    <p>You are uniquely identified as <%= session[:user][:login_name] %></p>
  </body>
</html>
