#! /usr/local/bin/ruby

def squared_sum(n)
  (1 .. n).reduce(:+) ** 2
end

def summed_squares(n)
  (1 .. n).map{|i| i * i}.reduce(:+)
end


if __FILE__ == $0
  number = 100
  puts squared_sum(number) - summed_squares(number)
end
