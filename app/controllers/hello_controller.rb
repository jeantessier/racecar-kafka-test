class HelloController < ApplicationController
  def index
    @name = params[:name] || 'world'

    publish @name

    render plain: 'OK'
  end

  private

  def publish(name)
    message = {
      date: DateTime.now,
      message: "Hello, #{name}!",
    }

    puts "Producing #{message}"
    kafka_producer.produce(
      topic: kafka_topic,
      key: current_time_millis.to_s,
      payload: message.to_json
    ).wait
  ensure
    kafka_producer.close
  end

  def kafka_config
    @kafka_config ||= { :"bootstrap.servers" => Racecar.config.brokers.first }
  end

  def kafka_producer
    @kafka_producer ||= Rdkafka::Config.new(kafka_config).producer
  end

  def kafka_topic
    @kafka_topic ||= ENV['KAFKA_TOPIC'] || 'some-topic'
  end

  def current_time_millis
    now = Time.now
    now.to_i * 1_000 + now.usec / 1_000
  end
end
