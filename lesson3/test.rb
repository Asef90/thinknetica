require_relative 'accessors'
require_relative 'validation'

class A
  include Accessors
  include Validation
  attr_accessor :one, :two, :three
  validate :one, :presence
  validate :two, :format, /^([A-Z]){3}/i
  validate :three, :type, Integer
end
