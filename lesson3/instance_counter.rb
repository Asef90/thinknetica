module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :instances

    def activate_instance_counter
      @instances = 0
    end

    def register_instance(object)
      self.instances += 1 if self == object.class
    end

    protected

    attr_writer :instances

  end


  module InstanceMethods

    protected

    def register_instance
      self.class.register_instance(self)
    end
  end
end
