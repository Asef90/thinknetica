calendar = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Enter day:"
day = gets.chomp.to_i

puts "Enter month:"
month = gets.chomp.to_i

puts "Enter year:"
year = gets.chomp.to_i

calendar[2] = 28 if (year % 4 != 0 || year % 100 == 0) && (year % 400 != 0)

num = 0
calendar.each.with_index(1) {|days, i| num += days if month > i}
num += day
puts num
