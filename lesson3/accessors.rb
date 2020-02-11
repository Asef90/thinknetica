# frozen_string_literal: true

module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |arg|
        raise 'Method name is not symbol' unless arg.is_a?(Symbol)

        arg_var = "@#{arg}".to_sym
        arg_history_var = "@#{arg}_history".to_sym

        define_method("#{arg}_history") { instance_variable_get(arg_history_var) }
        define_method(arg) { instance_variable_get(arg_var) }
        define_method("#{arg}=") do |value|
          instance_variable_set(arg_history_var, instance_variable_get(arg_history_var) || [])
          instance_variable_get(arg_var) &&
            (instance_variable_get(arg_history_var) << instance_variable_get(arg_var))
          instance_variable_set(arg_var, value)
        end
      end
    end

    def strong_attr_accessor(arg, arg_class)
      raise 'Method name is not symbol' unless arg.is_a?(Symbol)

      arg_var = "@#{arg}".to_sym
      define_method(arg) { instance_variable_get(arg_var) }
      define_method("#{arg}=") do |value|
        raise 'Class mismatch error.' unless value.class == arg_class

        instance_variable_set(arg_var, value)
      end
    end
  end
end
