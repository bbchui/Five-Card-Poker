require 'rspec'
require 'card'

describe Card do
  subject(:two_clubs) { Card.new('Club', '2') }
  describe '#initialize' do
    it 'initializes with a suit and a value' do
      expect(two_clubs.suit).to eq('Club')
      expect(two_clubs.value).to eq('2')
    end
  end
end
