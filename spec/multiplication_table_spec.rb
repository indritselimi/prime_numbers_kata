require 'spec_helper'

module PrimeNumbersKata
  describe Multiplicator do
    describe '.generate' do
      {
          [1] => [['x', 1],
                  [1, 1]],

          [1, 2] => [['x', 1, 2],
                     [1, 1, 2],
                     [2, 2, 4]],

          [1, 3] => [['x', 1, 3],
                     [1, 1, 3],
                     [3, 3, 9]],

          [3, 2] => [['x', 3, 2],
                     [3, 9, 6],
                     [2, 6, 4]],

          [5, 6, 9] => [['x', 5, 6, 9],
                        [5, 25, 30, 45],
                        [6, 30, 36, 54],
                        [9, 45, 54, 81]],

          [-4, 3] => [['x', -4, 3],
                      [-4, 16, -12],
                      [3, -12, 9]]

      }.each do |seed, table|
        it "multiplication table for #{seed} which is #{table}" do
          Multiplicator.new(seed).generate.to_a.should == table
        end
      end
    end

    describe Multiplicator::Table do
      describe '.max_element_length' do
        {
            [9, 1] => 1,
            [9, 111] => 3,
            [10**8, 9, 111] => 9,
            ['1234', 9, 111] => 4
        }.each do |matrix, max_element_length|
          it "returns #{max_element_length} for #{matrix}" do
            Multiplicator::Table.new(matrix).send(:max_element_length).should == max_element_length
          end
        end
      end

      describe '.show_on' do
        let(:table_content) { [['x', 1], [1, 1]] }
        let(:table) { Multiplicator::Table.new(table_content) }

        it 'shows the table on a display' do
          display = double('display')
          display.should_receive(:show).with(table)
          table.show_on(display)
        end
      end
    end
  end
end