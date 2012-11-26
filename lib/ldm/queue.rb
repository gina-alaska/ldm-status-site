require 'active_support/core_ext/numeric'

class Ldm
  class Queue
    CACHE_DURATION = 1.minute
  
    attr_reader :last_updated

    def initialize(path)
      @last_updated = Time.new(0)
      @path = path
      @files = Array.new
      scan_queue!
    end

    def files
      scan_queue!
      @files
    end

    private
    def refresh_cache?
      Time.now - @last_updated > CACHE_DURATION
    end

    def scan_queue!
      return false unless refresh_cache?
      if(File.exists?(@path) and File.directory?(@path))
        @files = Dir.glob(File.join(@path,"*")).sort{|x,y| File.mtime(x) <=> File.mtime(y)}.collect{|f| Pathname.new(f) }

        @last_updated = Time.now
      end

      true
    end
  end
end
