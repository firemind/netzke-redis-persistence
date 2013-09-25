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
    NetzkeRedisPersistence::Store.new("#{persistence_key}_#{Netzke::Base.controller.current_user.id if Netzke::Base.controller && Netzke::Base.controller.current_user}")
    #session[:netzke_states] ||= {}
    #session[:netzke_states][persistence_key] ||= {}
  end
end
