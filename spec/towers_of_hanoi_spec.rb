require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe '#initialize' do
    it 'initializes a board' do
      expect(game.board).to eq([[1,2,3],[],[]])
    end
  end

  describe '#move' do
    it 'Moves one ring to another pylon' do
      expect(game.move([0,1])).to eq([[2,3],[1],[]])
    end
    it 'Raises an error if the pylon is empty' do
      expect { game.move([1,2]) }.to raise_error('No Rings')
    end
    # it 'Raises an error if the input is incorrect' do
    #   expect { game.move('hello')}.to raise_error('Invalid Input')
    # end
  end

  describe '#play' do
    it 'Raises an error if the input is incorrect' do
      expect { game.move('hello')}.to raise_error('Invalid Input')
    end
  end

  describe '#won?' do
    let (:won_game) { TowersOfHanoi.new([[],[],[1,2,3]]) }
    it 'returns correctly when the game is won' do
      expect(won_game.won?).to eq(true)
    end

    it 'returns correctly when game is not won' do
      expect(game.won?).to eq(false)
    end
  end
end
