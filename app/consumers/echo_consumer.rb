class EchoConsumer < Racecar::Consumer
  subscribes_to ENV['KAFKA_TOPIC'] || 'some-topic'

  def process(message)
    puts "Received message: #{message.value}"
  end
end
