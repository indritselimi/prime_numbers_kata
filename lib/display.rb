module PrimeNumbersKata

  class Display
    def initialize(board)
      @board = board
    end

    def show(table)
      @board << serialize(table)
    end

    private

    def serialize(table)
      table.inject('') { |s, row| s << add_row(row, table.max_element_length) << "\n" }
    end

    def add_row(row, max_element_length)
      row.inject('') { |s, field| s << format_field(field, max_element_length) }
    end

    def format_field(field, length)
      fixed_field_length_format(length) % field.to_s
    end

    def fixed_field_length_format(length)
      "%#{length + 1}s"
    end
  end

end