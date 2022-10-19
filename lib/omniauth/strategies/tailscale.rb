require "omniauth"

module OmniAuth
  module Strategies
    class Tailscale
      include OmniAuth::Strategy

      def request_phase
        raise :request_phase
      end

    end
  end
end
