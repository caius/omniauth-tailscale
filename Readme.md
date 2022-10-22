# Omniauth::Tailscale

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

This is an unofficial OmniAuth Strategy for authenticating via [Tailscale][]. In this case we _can_ trust the network!

[Tailscale]: https://tailscale.com/

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add omniauth-tailscale

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install omniauth-tailscale

## Usage

Provided the server is being accessed over the tailnet, and a local tailscale client is running, that should be all the setup required for this to work.

Configure OmniAuth in your application to use the tailscale provider

```ruby
provider :tailscale
```

Wire up the `/auth/tailscale/callback` endpoint to handle the information handed back from the provider.

Wire up `/auth/failure` to handle authentication failure.

You should expect `:login_name` to contain the unique SSO identifier for the tailscale user

If you only want certain people to have access, or only allow access to specific groups you should use the Tailscale ACL to dis/allow access accordingly. If for some reason that's not possible, you will need to handle whitelisting people in the `/auth/tailscale/callback` handler yourself.

See the `examples/` subdirectories for example usage in applications.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-tailscale. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/omniauth-tailscale/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::Tailscale project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/omniauth-tailscale/blob/main/CODE_OF_CONDUCT.md).
