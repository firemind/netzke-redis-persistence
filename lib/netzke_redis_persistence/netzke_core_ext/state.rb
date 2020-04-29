require 'netzke/core/state'
Netzke::Core::State.module_eval do 
  # A string which identifies the component. Can be passed as +persistence_key+ config option. Two components with the same +persistence_key+ will be sharing the state.
  # If +persistence_key+ is passed, use it. Otherwise use js_id.
  def persistence_key
    (config.persistence_key || js_id).to_sym
  end

  # Component's persistent state.
  #
  #     state[:position] = {:x => 100, :y => 200}
  #
  #     state[:position] #=> {:x => 100, :y => 200}
  #
  # May be overridden by persistence subsystems. The object returned by this should implement the following methods:
  #
  # * []
  # * []=
  # * delete(key)
  # * clear

  def state
    state_by_key(persistence_key)
  end

  def child_state(name)
    state_by_key([js_id, name].join("__"))
  end

  def state_by_key(cmp_key)
    key = []
    if scope = NetzkeRedisPersistence.configuration.get_scope
      key << scope
    end
    key << persistence_key
    if Netzke::Base.controller && Netzke::Base.controller.respond_to?(:current_user) && Netzke::Base.controller.current_user
      key << Netzke::Base.controller.current_user.id
    end
    @store_cache ||={}
    @store_cache[key.join('_')] ||= NetzkeRedisPersistence::Store.new(key.join('_'))
  end
end
