require 'forwardable'

module PrimeNumbersKata
  class Multiplicator

    def initialize(seed)
      @seed = seed.unshift(1)
    end

    def generate
      Table.new(multiplication_matrix(@seed))
    end


    class Table
      include Enumerable
      extend Forwardable
      def_delegators :@table, :each
      alias :each_row :each

      def initialize(matrix)
        @table = matrix
      end

      def show_on(display)
        display.show self
      end

      def to_a
        @table.clone
      end

      def max_element_length
        to_a.flatten.map(&:to_s).map(&:length).max
      end
    end


    private

    def multiplication_matrix(seed)
      matrix = seed.map { |x| seed.map { |y| x*y } }
      set_top_left_placeholder(matrix, 'x')
      matrix
    end

    def set_top_left_placeholder(table, char)
      table[0][0] = char
    end
  end

end