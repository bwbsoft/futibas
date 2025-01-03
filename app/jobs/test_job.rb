class TestJob < ApplicationJob
  queue_as :default

  def perform
    puts "@@@@@@@@@@@@@@"
    puts "TestJob"
    puts "@@@@@@@@@@@@@@"
  end
end