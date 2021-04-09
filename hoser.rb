require "tweetstream"
require "kafka"
require 'pry'
require "dotenv"
Dotenv.load

TweetStream.configure do |config|
  config.consumer_key       = ENV["TWEETSTREAM_CONSUMER_KEY"]
  config.consumer_secret    = ENV["TWEETSTREAM_CONSUMER_SECRET"]
  config.oauth_token        = ENV["TWEETSTREAM_OAUTH_KEY"]
  config.oauth_token_secret = ENV["TWEETSTREAM_OAUTH_SECRET"]
  config.auth_method        = :oauth
end

kafka = Kafka.new([ENV["KAFKA_SERVER"]], client_id: ENV["APPLICATION_ID"])
producer = kafka.async_producer(delivery_threshold: 5)

TweetStream::Client.new.track(ENV["TWEET_TERM"]) do |status|
  producer.produce(status.text, topic: "first_topic")
end
