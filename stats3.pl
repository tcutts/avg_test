#!/usr/bin/perl
open F, "</tmp/data.txt";

my @ints = (<F>);

foreach (@ints) {
  $sum += $_;
}

$mean = $sum/scalar(@ints);

$sum = 0;

foreach (@ints) {
  $sum += ($_ - $mean)**2;
}

printf "Mean: %0.2f\nVariance: %0.2f\n", $mean, $sum/scalar(@ints);


