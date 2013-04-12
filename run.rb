#!/usr/bin/env ruby

$LOAD_PATH << 'lib'
require_relative 'lib/prime'
require_relative 'lib/multiplication_table'

module PrimeNumbersKata

  STDOUT << MultiplicationTable.new(Prime.first(10)).display

end