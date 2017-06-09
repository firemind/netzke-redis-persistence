
module NetzkeRedisPersistence
  class Configuration
    attr_accessor :redis_connection

    def get_redis_connection
      @redis_connection ? @redis_connection.call : Redis.new
    end
  end
end
