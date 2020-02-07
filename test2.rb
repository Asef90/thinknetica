class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
end

dog = Dog.new
