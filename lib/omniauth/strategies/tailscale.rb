require "debug"
require "omniauth"
require "tsclient"

module OmniAuth
  module Strategies
    class Tailscale
      include OmniAuth::Strategy

      def request_phase
        # TODO: hit tailscale's localapi to authenticate ourselves?

        profile = Tsclient.default_client.whois(request.env["REMOTE_ADDR"])

        if profile&.human?
          # FIXME: query string acceptable?!
          redirect "#{callback_url}?login_name=#{profile.identifier}&display_name=#{profile.name}"
        else
          fail!("No user found")
        end
      end

      def auth_hash
        # binding.break
        super
      end

      uid do
        request.params["login_name"]
      end

      info do
        {
          display_name: request.params["display_name"],
          profile_pic_url: request.params["profile_pic_url"]
        }
      end
    end
  end
end
