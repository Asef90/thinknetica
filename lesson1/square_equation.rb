puts "Please enter A:"
a = gets.chomp.to_i

puts "Please enter B:"
b = gets.chomp.to_i

puts "Please enter C:"
c = gets.chomp.to_i

discriminant = b ** 2 - 4 * a * c

if discriminant > 0
  root1 = ((-b) + Math.sqrt(discriminant)) / (2.0 * a)
  root2 = ((-b) - Math.sqrt(discriminant)) / (2.0 * a)
  puts "Discriminant is #{discriminant}, first root is #{root1}, second root is #{root2}"
elsif discriminant == 0
  root = (-b) / (2.0 * a)
  puts "Discriminant is #{discriminant}, root is #{root}"
else
  puts "Discriminant is #{discriminant}. No roots"
end

