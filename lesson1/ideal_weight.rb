puts "Hello. What is your name?"
name = gets.chomp
name.capitalize!

puts "What is your height in centimetres?"
height = gets.chomp.to_i

ideal_weight = (height - 110) * 1.15
print "#{name}, "
if ideal_weight >= 0
  puts "your ideal weight is #{ideal_weight}."
else
  puts "yout weight is already optimal."
end
