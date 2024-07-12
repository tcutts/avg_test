#!/usr/bin/perl

use strict;
use warnings;

open(my $fh, "<:raw", "/tmp/data.bin") or die "Cannot open file $!";

my @long_integers = ();
my $buffer;
while (read($fh, $buffer, 32768)) {
    my @unpacked = unpack('(q<*)*', $buffer);  # Unpack several long integers from the buffer
    push @long_integers, @unpacked;
}
close($fh);

my $sum = 0;

foreach (@long_integers) {
  $sum += $_;
}

my $mean = $sum/scalar @long_integers;

$sum = 0;
foreach (@long_integers) {
  $sum += ($_ - $mean)**2;
}
printf "Mean: %0.2f\nVariance: %0.2f\n", $mean, $sum/scalar @long_integers;
