# What is it

Toy app to show how you can connect to Twitter's Stream Api and produce Kakfa events with the stream.

![Screen Recording 2021-04-09 at 16 43 09](https://user-images.githubusercontent.com/3874566/114198296-70e01100-9953-11eb-9956-c8d5b8891105.gif)

# To run

First ensure that you have a Kafka consumer running locally to test, with a created topic. For Kafka 2.2 and above the partition should be set by default. 
- `kafka-topics.sh --bootstrap-server localhost:9092 --topic tweet_stream --create`
- `kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic tweet_stream`

To set up the Ruby client configure the `.env` with Twitter developer keys. You will need to set a Tweet term. Then run the application. If it works, you should start seeing the Tweets received in the running `kafka-console-consumer`

- `ruby hoser.rb`


