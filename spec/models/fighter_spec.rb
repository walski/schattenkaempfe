require 'spec_helper'

describe Fighter do
  before do
    @dice = MockDice.mock_random_dice!
  end
  let(:fighter) {create(:fighter)}

  describe "character calculations" do
    it "correctly determines the reaction" do
      expect(fighter.reaction).to eq (fighter.intelligence + fighter.quickness) / 2
    end

    it "correctly determines the combat pool" do
      expect(fighter.combat_pool).to eq (fighter.quickness + fighter.intelligence + fighter.willpower) / 2
    end
  end

  describe "initiative" do
    it "correctly rolled" do
      expect(fighter.initiative_roll).to eq @dice.rolls.sum + fighter.reaction
    end

    it "doesn't use the rule of six" do
      @dice.future_rolls += [6,5,5]
      expect(fighter.initiative_roll).to eq 11 + fighter.reaction
    end
  end
end