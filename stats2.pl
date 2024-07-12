#!/usr/bin/perl
open F, "</tmp/data.txt";

my @ints = (<F>);

map { $sum += $_ } @ints;

$mean = $sum/scalar(@ints);

$sum = 0;

map { $sum += ($_ - $mean)**2 } @ints;

printf "Mean: %0.2f\nVariance: %0.2f\n", $mean, $sum/scalar(@ints);


