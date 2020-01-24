fib = [0, 1]
while fib[-1] <= 100
  fib.push(fib[-1] + fib[-2])
end
fib.pop
