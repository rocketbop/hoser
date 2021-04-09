# What is it

Toy app to show how you can connect to Twitter's Stream Api and produce Kakfa events with the stream.

# To run

First ensure that you have a Kafka consumer running locally to test, with a created topic. For Kafka 2.2 and above the partition should be set by default. 
- `kafka-topics.sh --bootstrap-server localhost:9092 --topic tweet_stream --create`
- `kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic tweet_stream`

To set up the Ruby client configure the `.env` with Twitter developer keys. You will need to set a Tweet term. Then run the application. If it works, you should start seeing the Tweets received in the running `kafka-console-consumer`

- `ruby hoser.rb`
