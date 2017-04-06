require_relative 'deck'
require 'byebug'

class Hand

  CARD_ORDER = {
    'A' => 13,
    'K' => 12,
    'Q' => 11,
    'J' => 10,
    '10' => 9,
    '9' => 8,
    '8' => 7,
    '7' => 6,
    '6' => 5,
    '5' => 4,
    '4' => 3,
    '3' => 2,
    '2' => 1
  }

  attr_reader :hand_cards

  def initialize(hand_cards)
    @hand_cards = hand_cards
  end

  def find_fullhouse
    couple = []
    if self.find_triple
      triple = self.find_triple
      couple << triple
      remaining_cards = @hand_cards.select do |card|
        card.value != triple
      end

      remaining_cards = Hand.new(remaining_cards)

      second_pair = remaining_cards.find_pair
      couple << second_pair
      return couple if couple.length == 2
    end

  end


  def find_flush
    suit = @hand_cards[0].suit
    if @hand_cards.all? {|card| card.suit == suit}
      numeric_values = []
      @hand_cards.each do |el|
        numeric_values << CARD_ORDER[el.value]
      end
      numeric_values.sort!
      return numeric_values.last
    end
  end


  def find_straight
    straights = []
    @hand_cards.each { |card| straights << card.value }
    deck = ['A','2','3','4','5','6','7','8','9','10','J','Q','K','A']
    deck.each_cons(5) do |x|
      return straights if x == straights
    end
  end

  def find_triple
    count = 0
    i = 0
    while i < @hand_cards.length
      j = i + 1
      while j < @hand_cards.length
        count += 1 if @hand_cards[i].value == @hand_cards[j].value
        j += 1
      end
      return @hand_cards[i].value if count == 3
      i += 1
    end
  end

  def two_pair
    couple = []
    first_pair = self.find_pair
    couple << first_pair
    remaining_cards = @hand_cards.select do |card|
      card.value != first_pair
    end

    remaining_cards = Hand.new(remaining_cards)

    second_pair = remaining_cards.find_pair
    couple << second_pair
    return couple.sort if couple.length == 2

  end

  def find_pair
    i = 0
    while i < @hand_cards.length
      j = i + 1
      while j < @hand_cards.length
        return @hand_cards[i].value if @hand_cards[i].value ==
          @hand_cards[j].value
        j += 1
      end
      i += 1
    end
  end
end

# two_clubs = Card.new('Clubs', 'A')
# two_hearts = Card.new('Clubs', '3')
# three_clubs = Card.new('Clubs', '4')
# four_clubs = Card.new('Clubs', '5')
# four_spades =  Card.new('Clubs', '2')
# pair_hand =  Hand.new([two_clubs, two_hearts, three_clubs,
#   four_clubs,four_spades])
#
# p pair_hand.find_flush
