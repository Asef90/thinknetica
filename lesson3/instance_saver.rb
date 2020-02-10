module InstanceSaver
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :all_instances

    def all
      @all_instances
    end
  end

  module InstanceMethods
    protected

    def add_instance
      self.class.all_instances ||= []
      self.class.all_instances << self
    end
  end
end
