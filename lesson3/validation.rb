module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    # rubocop:disable Metrics/CyclomaticComplexity
    def validate(var, method, arg = nil)
      raise 'Method name is not symbol' unless var.is_a?(Symbol) && method.is_a?(Symbol)
      raise 'No additional arguments needed for :presence' if method == :presence && arg
      raise 'Additional argument required' if %i[format type].include?(method) && arg.nil?

      self.validations ||= []
      validations << { method: method, var: var, arg: arg }
    end
    # rubocop:enable Metrics/CyclomaticComplexity
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |elem|
        send(elem[:method], instance_variable_get("@#{elem[:var]}".to_sym), elem[:arg])
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    protected

    def presence(var, _arg)
      var.strip! if var.is_a?(String)
      raise 'Attribute cannot be empty' if ['', nil].include?(var)
    end

    def format(var, arg)
      raise 'Wrong format for Regexp' unless arg.class == Regexp

      raise 'Attribute mismatch' unless var =~ arg
    end

    def type(var, arg)
      raise 'Class not exist' unless arg.class == Class

      raise 'Class mismatch' unless var.class == arg
    end
  end
end
