puts "Please enter lengths of the sides of triangle. Side A:"
a = gets.chomp.to_i

puts "Side B:"
b = gets.chomp.to_i

puts "Side C:"
c = gets.chomp.to_i

if (a > b && a > c)
  hyp = a
  cat1 = b
  cat2 = c
elsif (b > a && b > c)
  hyp = b
  cat1 = a
  cat2 = c
else
  hyp = c
  cat1 = a
  cat2 = b
end

if (a == b) && (b == c)
  puts "It is an equilateral and isosceles triangle."
elsif (a == b) || (a == c) || (b == c)
  puts "It is an isosceles triangle."
elsif (hyp ** 2 == cat1 ** 2 + cat2 ** 2)
  puts "It is a right triangle."
end
