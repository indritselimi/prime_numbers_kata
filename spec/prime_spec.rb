require 'spec_helper'

module PrimeNumbersKata

  describe Prime do
    context '.first' do
      [
          [1, [2]],
          [3, [2,3,5]],
          [6, [2,3,5,7,11,13]]
      ].each do |n, primes|
        it "returns first #{n} #{primes}" do
           Prime.first(n).should == primes
        end
      end
    end

    context '.prime?' do
      [
        [0, false],
        [3, true],
        [8, false],
        [10007, true],
      ].each do |number, is_prime|
        it "returns #{is_prime} for #{number}" do
          Prime.prime?(number).should equal(is_prime)
        end
      end
    end

    context '.prime_factors' do
      some_big_number  = [2,3,5,7,11,8191]
      [
          [1, []],
          [2, [2]],
          [3, [3]],
          [4, [2,2]],
          [5, [5]],
          [6, [2,3]],
          [8, [2]*3],
          [9, [3,3]],
          [10,[2,5]],
          [3**100,[3]*100],
          [some_big_number.inject(:*), some_big_number]
      ].each do |number, factors|
        it "returns #{factors} for #{number}" do
          Prime.prime_factors(number).should == factors
        end
      end
    end
  end
end