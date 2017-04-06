require 'first_tdd'
require 'rspec'

describe Class do
  describe '#my_uniq' do
    it 'returns an empty array when array is empty' do
      expect([].my_uniq).to eq([])
    end
    it 'returns correct amount of unique elements' do
      expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end
  end

  describe '#two_sum' do
    it 'returns an empty array when array is empty' do
      expect([].two_sum).to be_empty
    end
    it 'returns an empty array when no two elements sum to 0' do
      expect([5,1,3,2].two_sum).to be_empty
    end

    context 'when there are elements that sum to zero' do
      it 'returns indices in order' do
        expect([-1,0,2,-2,1].two_sum).to eq([[0,4], [2,3]])
      end
    end
  end

  describe '#my_transpose' do
    it 'returns an empty array when array is empty' do
      expect([].my_transpose).to be_empty
    end

    it 'it transposes a square' do
      expect([[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose).to eq(
      [[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end

    it 'transposes a rectangle' do
      expect([[1,2],[3,4],[5,6]].my_transpose).to eq([[1,3,5],[2,4,6]])
    end
  end

  describe '#stock_picker' do
    it 'returns an empty array when array is empty' do
      expect([].stock_picker).to be_empty
    end
    it 'returns the correct days to buy and sell' do
      expect([5,6,7,9,10,5].stock_picker).to eq([0,4])
    end
    it 'returns an empty array when there is no profit' do
      expect([10,9,8,7,6].stock_picker).to be_empty
    end

  end
end
