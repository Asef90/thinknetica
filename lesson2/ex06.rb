products = {}

loop do
  puts "Enter product name:"
  product = gets.chomp.downcase

  break if (product == "stop")

  puts "Enter unit price:"
  price = gets.chomp.to_f

  puts "Enter number of products:"
  quantity = gets.chomp.to_f

  products[product] = Hash[price, quantity]
end

total = 0
products.each do |product, params|
  params.each do |price, quantity|
    cost = price * quantity
    total += cost
    puts "Product: #{product}, price: #{price}, quantity: #{quantity}, cost: #{cost}"
  end
end
puts "Total cost: #{total}"
