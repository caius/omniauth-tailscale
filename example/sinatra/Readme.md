# Sinatra Example

Simple sinatra application wired up with Tailscale provider.

Install dependencies & run listening on your tailscale interface:

```shell
$ bundle install
$ bundle exec ruby app.rb -o $(tailscale ip -4)
```

Then load the URL it spits out in your browser and you should run through the Tailscale authenticate flow without having to interact with it, and be shown the dashboard with your user info present.
