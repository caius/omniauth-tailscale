require "debug"
require "omniauth"

module OmniAuth
  module Strategies
    class Tailscale
      include OmniAuth::Strategy

      def request_phase
        # TODO: hit tailscale's localapi to authenticate ourselves?

        p request.env["REMOTE_ADDR"]

        p callback_url

        # FIXME: include tailscale params somehow - query string?
        redirect "#{callback_url}?login_name=caius%40caius.name&display_name=Caius%20Durling"
      end

      def auth_hash
        binding.break
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
