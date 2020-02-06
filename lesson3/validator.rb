# frozen_string_literal: true

module Validator
  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end
  end
end
