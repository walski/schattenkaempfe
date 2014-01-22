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

    it "correctly determines the combat pool" do
      fighter.combat_pool.should eq (fighter.quickness + fighter.intelligence + fighter.willpower) / 2
    end
  end

  describe "initiative" do
    it "correctly rolled" do
      fighter.initiative_roll.should eq @dice.rolls.sum + fighter.reaction
    end

    it "doesn't use the rule of six" do
      @dice.future_rolls += [6,5,5]
      fighter.initiative_roll.should eq 11 + fighter.reaction
    end
  end
end