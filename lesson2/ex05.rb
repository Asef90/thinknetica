calendar = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Enter day:"
day = gets.chomp.to_i

puts "Enter month:"
month = gets.chomp.to_i

puts "Enter year:"
year = gets.chomp.to_i

calendar[2] = 28 if (year % 4 != 0 || year % 100 == 0) && (year % 400 != 0)

num = 0
calendar.each_index {|i| num += calendar[i] if month > i + 1}
num += day
