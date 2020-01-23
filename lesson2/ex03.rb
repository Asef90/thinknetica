fib = [0, 1]
i = 1
while fib[i] <= 100 do
  fib.push(fib[i] + fib[i - 1])
  i += 1
end
fib.pop
