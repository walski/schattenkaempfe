require 'spec_helper'

describe Fighter do
  before do
    @dice = MockDice.mock_random_dice!
  end
  let(:fighter) {create(:fighter)}

  describe "character calculations" do
    it "correctly determines the reaction" do
      fighter.reaction.should eq (fighter.intelligence + fighter.quickness) / 2
    end
  end

  describe "rolls" do
    it "correctly rolls the initiative" do
      fighter.initiative_roll.should eq @dice.rolls.sum + fighter.reaction
    end
  end
end