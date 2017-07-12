
module NetzkeRedisPersistence
  class Configuration
    attr_accessor :redis_connection, :scope

    def get_redis_connection
      @redis_connection ? @redis_connection.call : Redis.new
    end
    
    def get_scope
      @scope
    end
  end
end
