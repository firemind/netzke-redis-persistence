
module NetzkeRedisPersistence
  class Configuration
    attr_accessor :redis_connection

    def initialize
      @redis_connection = Redis.new
    end
  end
end
