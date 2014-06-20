require_relative '../lib/evaluate_hand.rb' unless defined?(EvaluateHand)
require_relative '../lib/factories/hand_factory' unless defined?(HandFactory)


describe EvaluateHand do
  describe '#is_royal_flush?' do
    it 'should only detect a royal flush' do
      expect(EvaluateHand.is_royal_flush?(HandFactory.royal_flush)).to eq true
    end
  end

  describe '#is_four_of_a_kind' do
    it 'should detect 4 of a kind' do
      expect(EvaluateHand.is_four_of_a_kind?(HandFactory.four_of_a_kind)).to eq true
    end

    it 'should not detect a full house' do
      expect(EvaluateHand.is_four_of_a_kind?(HandFactory.full_house)).to eq false
    end
  end

  describe '#is_full_house' do
    it 'should detect a full house' do
      expect(EvaluateHand.is_full_house?(HandFactory.full_house)).to eq true
    end

    it 'should not detect three of a kind' do
      expect(EvaluateHand.is_full_house?(HandFactory.three_of_a_kind)).to eq false
    end
  end

  describe '#is_flush?' do
    it 'should return true for a flush of cards' do
      expect(EvaluateHand.is_flush?(HandFactory.flush).first).to eq true
      other_flush_hand = [Card.new('2'), Card.new('2', 'Clubs'),
                          Card.new('9', 'Clubs'), Card.new('10', 'Clubs'),
                          Card.new('7', 'Clubs'), Card.new('2', 'Hearts'),
                          Card.new('K', 'Clubs')]
      expect(EvaluateHand.is_flush?(other_flush_hand).first).to eq true
    end

    it 'should return false for not a flush' do
      expect(EvaluateHand.is_flush?(HandFactory.high_card).first).to eq false
    end
  end

  describe '#is_straight?' do
    it 'should return true for a straight of cards' do
      expect(EvaluateHand.is_straight?(HandFactory.straight)).to eq true
    end
  end

  describe '#is_three_of_a_kind' do
    it 'should detect 3 of a kind' do
      expect(EvaluateHand.is_three_of_a_kind?(HandFactory.three_of_a_kind)).to eq true
    end

    it 'should not detect a non three of a kind' do
      expect(EvaluateHand.is_three_of_a_kind?(HandFactory.high_card)).to eq false
    end
  end

  describe '#is_two_pair?' do
    it 'should detect two pair' do
      expect(EvaluateHand.is_two_pair?(HandFactory.two_pair)).to eq true
    end

    it 'should not detect one pair' do
      expect(EvaluateHand.is_two_pair?(HandFactory.pair)).to eq false
    end
  end

  describe '#is_one_pair?' do
    it 'should detect a pair' do
      expect(EvaluateHand.is_one_pair?(HandFactory.pair)).to eq true
    end

    it 'should not detect a non pair' do
      expect(EvaluateHand.is_one_pair?(HandFactory.high_card)).to eq false
    end
  end

  describe '#is_high_card?' do
    it 'should detect a high card hand' do
      expect(EvaluateHand.is_high_card?(HandFactory.high_card)).to eq true
    end
  end
end