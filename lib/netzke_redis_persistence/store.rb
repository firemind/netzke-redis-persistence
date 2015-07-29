module NetzkeRedisPersistence
  class Store
    attr_accessor :redis, :custom_key

    def initialize(custom_key)
      @redis = Redis.new
      @custom_key = custom_key
    end

    def []=(key, val)
      val = Marshal.dump(val)
      redis.set(scoped_key(key), val)
    end

    def [](key)
      v = redis.get(scoped_key(key))
      begin
        v && Marshal.load(v)
      rescue => e
        r = e.message.match(/undefined class\/module (.*)/)
        if r[1]
          r[1].constantize.class
          self[key]
        end
      end
    end

    def delete(key)
      @redis.del key
    end

    def clear
      keys = @redis.keys "#{session_key}*"
      keys.each do |key|
        self.delete key
      end
    end

    def scoped_key(key)
      "#{session_key}_#{key}"
    end

    def session_key
      "netzke_states_#{@custom_key}"
    end
  end

end
