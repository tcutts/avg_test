#!/usr/bin/perl
open F, "</tmp/data.txt";

while (<F>) {
  $sum += $_;
  $n++;
}

$mean = $sum/$n;
seek(F, 0, 0);

$sum = 0;
while (<F>) {
  $sum += ($_ - $mean)**2;
}
printf "Mean: %0.2f\nVariance: %0.2f\n", $mean, $sum/$n;

