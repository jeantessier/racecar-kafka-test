# README

A test Kafka consumer that uses the `racecar` gem.

I built it originally to go with my `[micronaut-kafka-test](https://github.com/jeantessier/micronaut-kafka-test)`
app, but you can use it with any Kafka topic.

## To Run

To echo a specific topic:

    $ KAFKA_TOPIC=your-topic-name-goes-here bundle exec racecar EchoConsumer

To echo the default `some-topic` topic:

    $ bundle exec racecar EchoConsumer
