# frozen_string_literal: true

require "spec_helper"

describe Omniauth::Tailscale do
  it "has a version number" do
    value(Omniauth::Tailscale::VERSION).wont_be_nil
  end
end
