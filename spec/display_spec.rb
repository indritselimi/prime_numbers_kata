require 'spec_helper'

module PrimeNumbersKata
  describe Display do
    let(:board) {
      s_io = StringIO.new
      (class << s_io;self end).send(:alias_method, :content, :string)
      s_io
    }
    let(:display) { Display.new(board) }

    def table(data)
      Multiplicator::Table.new(data)
    end


    describe '.show' do
      it 'shows a table on display' do
        display.show table([['x', 1], [1, 1]])
        board.content.should == " x 1\n 1 1\n"
      end

      it 'padding correctly its elements' do
        display.show Multiplicator::Table.new([['x', 1], [12345, 1]])
        board.content.should == "     x     1\n 12345     1\n"
      end
    end

  end
end