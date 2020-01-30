module InstanceSaver

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def activate_instance_saver
      @all_instances = []
    end

    def all
      @all_instances
    end

    def add_instance(object)
      all << object if self == object.class && !(all.include?(object))
    end

    protected

    attr_writer :all_instances
  end

  module InstanceMethods

    protected
    def add_instance
      self.class.add_instance(self)
    end

  end
end
