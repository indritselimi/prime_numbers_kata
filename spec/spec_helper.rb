require "rspec"
%w(prime multiplicator display).each{|f| require_relative "../lib/#{f}"}
