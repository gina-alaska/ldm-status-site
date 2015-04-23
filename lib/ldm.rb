require 'pathname'
require "./lib/ldm/queue.rb"

class Ldm
  LDM_DATA_PATH = "/usr/local/ldm/data/ldm"
  attr_reader :queues


  def initialize
    @queues = Hash.new
    queues = Dir.glob(File.join(LDM_DATA_PATH, '*')).select{|d| File.directory?(d) }

    queues.each do |queue|
      name = queue.split("/").last
      @queues[name] = Ldm::Queue.new(queue)
    end
  end

  
end
