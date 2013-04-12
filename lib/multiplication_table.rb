module PrimeNumbersKata
  class MultiplicationTable

    def initialize(seed)
      @seed = seed.unshift(1)
    end

    def display
      max_number_length = (@seed.max ** 2).to_s.length
      format = "%#{max_number_length + 1}s"

      generate.inject('') do |s, rows|
        rows.each { |cell| s << (format % cell.to_s) }
        s << "\n"
      end
    end

    def generate
      create_table(@seed.size) do |table|
        table.each_with_index do |row, y|
          row.each_index do |x|
            table[y][x] = @seed[x] * @seed[y]
          end
        end
      end
    end

    private

    def create_table(size)
      table = yield Array.new(size) { Array.new(size, 0) }
      set_top_left_placeholder(table)
      table
    end

    def set_top_left_placeholder(table)
      table[0][0] = 'x'
    end
  end

end