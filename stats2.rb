#!/usr/bin/ruby

# Based on ~tjrc/src/avg_stats/stats2.pl

f = File.new("/tmp/data.txt")
ints = f.readlines.map { |str| str.to_i }

class Array
  def sum # is pre-defined as part of Rails; probably not exactly like this
    inject(0) {|tot,obj| tot + obj }
  end
end

sum = ints.sum
sum += 0.0 # force conversion to some kind of Float, for all further calculations

mean = sum / ints.size


sum_sq = ints.inject(0) do |tot, num|
  tot + (num - mean) ** 2
end

printf "Mean: %0.2f\nVariance: %0.2f\n", mean, sum_sq/ints.size;
