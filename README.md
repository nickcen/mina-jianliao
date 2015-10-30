# Mina::Jianliao

## Installation

Add this line to your application's Gemfile:

    gem 'mina-jianliao'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-jianliao

In your jianliao settings, create new Incomming WebHooks and get WebHooks URL.

## Usage

### Load the recipe
Include the recipe in your deploy.rb

    # config/deploy.rb
    require 'mina/jianliao'

### Setup Jianliao Details
You'll need to setup your jianliao details with an API key, room and subdomain. You can add these as ENV variables or in the config/deploy.rb

    # required
    set :jianliao_url, "webhook_token" # comes from inbound webhook integration    

    # optional
    set :jianliao_application, "Application Name"
    set :jianliao_authorname, "Deploy Bot" # displayed as name of message sender

Or use the ENV variables:

    # required
    ENV['JIANLIAO_URL'] = ''
    
    # optional
    ENV['JIANLIAO_APPLICATION'] = ''
    ENV['JIANLIAO_AUTHORNAME'] = ''

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
