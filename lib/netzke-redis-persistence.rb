require "redis"
require "netzke_redis_persistence/configuration"
require "netzke_redis_persistence/netzke_core_ext/state"

module NetzkeRedisPersistence
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
require "netzke_redis_persistence/store"
