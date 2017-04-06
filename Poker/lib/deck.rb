require_relative 'card'
class Deck
  SUITS = [
    'Clubs',
    'Hearts',
    'Diamonds',
    'Spades'
  ]

  VALUES = ['A','2','3','4','5','6','7','8','9','10','J','Q','K']

  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  private

  def build_deck
    deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        deck << Card.new(suit, value)
      end
    end
    deck
  end
end
