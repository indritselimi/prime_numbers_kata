require 'spec_helper'

module PrimeNumbersKata

  describe Prime do
    describe '.first' do
      it "first prime is 2" do
        Prime.first(1).should == [2]
      end

      [
          [3, [2, 3, 5]],
          [7, [2, 3, 5, 7, 11, 13,17]]
      ].each do |n, primes|
        it "first #{n} primes are #{primes*','}" do
          Prime.first(n).should == primes
        end
      end
    end

    describe '.prime?' do
      [3, 5, 11, 10007].each do |number|
        it "#{number} is prime" do
          Prime.prime?(number).should be_true
        end
      end

      [0, 6, 8, 10008].each do |number|
        it "#{number} is composite" do
          Prime.prime?(number).should be_false
        end
      end
    end

    describe '.prime_factors' do
      some_big_number = [2, 3, 5, 7, 11, 8191]
      [
          [1, []],
          [2, [2]],
          [3, [3]],
          [4, [2, 2]],
          [5, [5]],
          [6, [2, 3]],
          [8, [2]*3],
          [9, [3, 3]],
          [10, [2, 5]],
          [3**100, [3]*100],
          [some_big_number.inject(:*), some_big_number]
      ].each do |number, factors|
        it "#{number} has (#{factors*','}) factors" do
          Prime.prime_factors(number).should == factors
        end
      end
    end
  end
end