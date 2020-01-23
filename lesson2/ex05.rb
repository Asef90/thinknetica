calendar = {
  1 => 31,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

puts "Enter day:"
day = gets.chomp.to_i

puts "Enter month:"
month = gets.chomp.to_i

puts "Enter year:"
year = gets.chomp.to_i

if (year % 4 != 0 || year % 100 == 0) && (year % 400 != 0)
  calendar[2] = 28
else
  calendar[2] = 29
end

num = 0
calendar.each {|month_n, days| num += days if month_n < month}
num += day
