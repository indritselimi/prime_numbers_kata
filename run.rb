#!/usr/bin/env ruby

$LOAD_PATH << 'lib'

%w(prime multiplicator display).each{|f| require_relative "lib/#{f}"}

module PrimeNumbersKata
  number_of_primes = ARGV.empty? ? 10 : ARGV.shift.to_i

  console = Display.new(STDOUT)

  Multiplicator.new(Prime.first(number_of_primes)).generate.show_on(console)
end