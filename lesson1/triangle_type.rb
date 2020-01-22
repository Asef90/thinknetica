puts "Please enter lengths of the sides of triangle. Side A:"
a = gets.chomp.to_i

puts "Side B:"
b = gets.chomp.to_i

puts "Side C:"
c = gets.chomp.to_i

a, b, c = [a, b, c].max(3)

if (a == b) && (b == c)
  puts "It is an equilateral and isosceles triangle."
elsif (a == b) || (a == c) || (b == c)
  puts "It is an isosceles triangle."
elsif (a**2 == b**2 + c**2)
  puts "It is a right triangle."
end
