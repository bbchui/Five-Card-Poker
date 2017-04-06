require 'rspec'
require 'deck'
require 'hand'

describe Hand do
  let(:deck) { Deck.new }
  subject(:hand) { Hand.new(deck.cards.shuffle[0..4]) }
  let(:bad_hand) { Hand.new(deck.cards[0..4]) }
  describe '#initialize' do
    it 'initializes with 5 cards' do
      expect(hand.hand_cards.length).to eq(5)
    end
  end

  describe '#find_pair' do
    let(:two_clubs) {Card.new('Clubs', '2')}
    let(:two_hearts) {Card.new('Hearts', '2')}
    let(:three_clubs) {Card.new('Clubs', '3')}
    let(:four_clubs) {Card.new('Clubs', '4')}
    let(:five_clubs) { Card.new('Clubs', '5') }
    let(:pair_hand) { Hand.new([two_clubs, two_hearts, three_clubs,
      four_clubs,five_clubs]) }
    it 'identifies pairs in a hand' do
      expect(pair_hand.find_pair).to eq('2')
    end
    it 'returns nil if there is no pair' do
      expect(bad_hand.find_pair).to eq(nil)
    end
  end

  describe '#two_pair' do
    let(:two_clubs) {Card.new('Clubs', '2')}
    let(:two_hearts) {Card.new('Hearts', '2')}
    let(:four_spades) {Card.new('Spades', '4')}
    let(:four_clubs) {Card.new('Clubs', '4')}
    let(:five_clubs) { Card.new('Clubs', '5') }
    let(:two_pair_hand) { Hand.new([two_clubs, two_hearts, four_spades,
      four_clubs,five_clubs]) }
    it 'identies two pairs in a hand' do
      expect(two_pair_hand.two_pair).to eq(['2','4'])
    end
  end

  describe '#find_triple' do
    let(:two_clubs) {Card.new('Clubs', '2')}
    let(:two_hearts) {Card.new('Hearts', '2')}
    let(:two_spades) {Card.new('Spades', '2')}
    let(:four_clubs) {Card.new('Clubs', '4')}
    let(:five_clubs) { Card.new('Clubs', '5') }
    let(:triple_hand) { Hand.new([two_clubs, two_hearts, two_spades,
      four_clubs,five_clubs]) }
    it 'identifies three of a kind in a hand'  do
      expect(triple_hand.find_triple).to eq('2')
    end
  end

  describe '#find_straight' do
    let(:two_clubs) {Card.new('Clubs', '2')}
    let(:two_hearts) {Card.new('Hearts', '2')}
    let(:two_spades) {Card.new('Spades', '2')}
    let(:four_clubs) {Card.new('Clubs', '4')}
    let(:five_clubs) { Card.new('Clubs', '5') }
    let(:triple_hand) { Hand.new([two_clubs, two_hearts, two_spades,
      four_clubs,five_clubs]) }
    it 'doesn\'t identify a straight if there is none'  do
      expect(triple_hand.find_straight).to eq(nil)
    end

    it 'correctly identifies straights' do
      expect(bad_hand.find_straight).to eq(['A','2','3','4','5'])
    end
  end

  describe 'find_flush' do
    let(:two_clubs) {Card.new('Clubs', '2')}
    let(:two_hearts) {Card.new('Hearts', '2')}
    let(:two_spades) {Card.new('Spades', '2')}
    let(:four_clubs) {Card.new('Clubs', '4')}
    let(:five_clubs) { Card.new('Clubs', '5') }
    let(:triple_hand) { Hand.new([two_clubs, two_hearts, two_spades,
      four_clubs,five_clubs]) }
    it 'doesn\'t identify a flush if there is none'  do
      expect(triple_hand.find_flush).to eq(nil)
    end

    it 'correctly identifies flushes if there is one' do
      expect(bad_hand.find_flush).to eq(13)
    end
  end

  describe 'find_fullhouse' do
    let(:two_clubs) {Card.new('Clubs', '2')}
    let(:two_hearts) {Card.new('Hearts', '2')}
    let(:two_spades) {Card.new('Spades', '2')}
    let(:four_clubs) {Card.new('Clubs', '4')}
    let(:five_clubs) { Card.new('Spades', '4') }
    let(:fullhouse_hand) { Hand.new([two_clubs, two_hearts, two_spades,
      four_clubs,five_clubs]) }
    it 'correctly identifies a fullhouse if there is one' do
      expect(fullhouse_hand.find_fullhouse).to eq(['2','4'])
    end

    it 'does not identify a fullhouse if there is none' do
      expect(bad_hand.find_fullhouse).to eq(nil)
    end
  end

end
