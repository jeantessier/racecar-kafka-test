class EchoConsumer < Racecar::Consumer
  subscribes_to ENV['KAFKA_TOPIC'] || 'some-topic'

  def process(message)
    puts "#{message.topic}[#{message.partition}] offset: #{message.offset}, timestamp: #{message.create_time}, headers: #{message.headers}, key: #{message.key}, value: #{message.value}"
  end
end
