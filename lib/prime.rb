module PrimeNumbersKata
  class Prime
    class << self
      def first(n)
        prime_numbers.first(n)
      end

      def prime?(n)
        prime_factors(n).size == 1
      end

      def prime_factors(n)
        factors = []
        candidate = 2
        while n > 1
          while n % candidate == 0
            factors << candidate
            n /= candidate
          end
          candidate += 1
        end
        factors
      end

      private

      def prime_numbers
        Enumerator.new do |yielder|
          candidate = 2
          loop do
            yielder.yield candidate if prime?(candidate)
            candidate += 1
          end
        end
      end
    end
  end
end