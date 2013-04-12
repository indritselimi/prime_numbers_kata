require 'spec_helper'

module PrimeNumbersKata
  describe MultiplicationTable do
    context '.generate' do
      {
          [1] => [['x', 1],
                  [1, 1]],

          [1, 2] => [['x',1, 2],
                     [1, 1, 2],
                     [2, 2, 4]],

          [1, 3] => [['x',1, 3],
                     [1, 1, 3],
                     [3, 3, 9]],

          [3, 2] => [['x',3, 2],
                     [3, 9, 6],
                     [2, 6, 4]],

          [5, 6, 9] => [['x',5, 6, 9],
                        [5, 25, 30, 45],
                        [6, 30, 36, 54],
                        [9, 45, 54, 81]],

          [-4, 3] => [['x',-4, 3],
                     [-4, 16, -12],
                     [3, -12, 9]],


      }.each do |seed, table|
        it "returns #{table} for #{seed}" do
          MultiplicationTable.new(seed).generate.should == table
        end
      end
    end

    context '.show' do
      it 'displays multiplication table' do
        MultiplicationTable.new([1]).display.should == " x 1\n 1 1\n"
      end
    end
  end
end