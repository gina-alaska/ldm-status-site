require 'active_support/core_ext/numeric'

class Ldm
  class Queue
    CACHE_DURATION = 1.minute

    MATCH_LIST = /^SSEC_AWIPS_(GEOCAT-MOD|VIIRS-AK)/
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
        @files = Dir.glob(File.join(@path,"SSEC_AWIPS_*")).select{|f| f =~ /(MOD_ALAS|VIIRS-AK)/}
	@files << Dir.glob(File.join(@path,"*sport*"))
	@files.flatten!
	@files.sort!{|x,y| File.mtime(y) <=> File.mtime(x)}.map{|f| Pathname.new(f) }
        @last_updated = Time.now

      end

      true
    end
  end
end
