require 'mina/hooks'
require 'json'
require 'net/http'

# Before and after hooks for mina deploy
before_mina :deploy, :'jianliao:starting'
after_mina :deploy, :'jianliao:finished'


# Jianliao tasks
namespace :jianliao do

  task :starting do
    if jianliao_url
      set(:start_time, Time.now)
    else
      print_local_status "Unable to create Jianliao Announcement, no jianliao details provided."
    end
  end

  task :finished do
    if jianliao_url
      end_time = Time.now
      start_time = fetch(:start_time)
      elapsed = end_time.to_i - start_time.to_i

      announcement = "#{announced_deployer} successfully deployed #{announced_application_name} in #{elapsed} seconds."

      post_jianliao_message(announcement)
    else
      print_local_status "Unable to create Jianliao Announcement, no jianliao details provided."
    end
  end

  def short_revision
    deployed_revision[0..7] if deployed_revision
  end

  def announced_application_name
    "".tap do |output|
      output << jianliao_application if jianliao_application
      output << " (#{short_revision})" if short_revision
    end
  end

  def post_jianliao_message(message)
    # Parse the URI and handle the https connection
    uri = URI.parse(jianliao_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    payload = {
      "username"    => jianliao_authorname,
      "text"        => message
    }

    # Create the post request and setup the form data
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(:payload => payload.to_json)

    # Make the actual request to the API
    http.request(request)
  end
end
