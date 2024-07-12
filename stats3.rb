#!/usr/bin/ruby

f = File.new("/tmp/data.txt")

sum_sq = 0
sum = 0
count = 0
f.each_line do |str|
  int = str.to_i
  count += 1
  sum += int
  sum_sq += int ** 2
end

sum += 0.0 # force conversion to some kind of Float, for all further calculations

mean = sum / count

sum_sq += count * (mean ** 2) - 2 * mean * sum # based on expansion of quadratic sum(( ints[i] - mean ) ** 2 )

printf "Mean: %0.2f\nVariance: %0.2f\n", mean, sum_sq/count
