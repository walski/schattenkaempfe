Dice
class Dice
  class << self
    alias _original_random_number random_number

    def random_number(sides)
      return _original_random_number(sides) unless mock_dice
      @mock_dice.pop(sides)
    end

    def mock_dice=(dice)
      @mock_dice = dice
    end

    def mock_dice
      @mock_dice
    end

    def reset_mock!
      @mock_dice = nil
    end
  end
end


class MockDice
  attr_accessor :rolls, :future_rolls

  def initialize
    @future_rolls = []
    @rolls = []
  end

  def pop(sides)
    roll = @future_rolls.empty? ? Dice._original_random_number(sides) : @future_rolls.shift
    (@rolls << roll).last
  end

  def self.mock_random_dice!
    Dice.mock_dice = new
  end
end