require 'rspec'
require 'deck'

describe Deck do
  let(:new_deck) { Deck.new }
  describe '#initialize' do
    it 'initializes a deck with 52 cards' do
      expect(new_deck.cards.length).to eq(52)
    end
    # Card.VALUES.each do |value|
    #   it "has 4 of #{value}" do
    #   expect
    # end
    # it 'has four of each value' do
    #   is_true = Card.VALUES.all? do |value|
    #   end
    #   expect(is)
    # end
  end
end
