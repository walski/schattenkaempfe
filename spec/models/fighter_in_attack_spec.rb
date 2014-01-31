require 'spec_helper'

describe FighterInAttack do
  before do
    @dice = MockDice.mock_random_dice!
  end

  let(:attack) {Attack.new(attacker: create(:fighter_in_action), defender: create(:fighter_in_action))}
  let(:fighter) {attack.attacker}

  it "knows the target to hit the fighter" do
    expect(fighter.target_roll_to_be_attacked).to eq 4
  end

  it "uses no combat pool dices" do
    expect(fighter.combat_pool_to_use).to eq 0
  end

  it "has a combat skill of 4" do
    expect(fighter.combat_skill).to eq 4
  end

  describe "attack roll" do
    before do
      fighter # create fighter to mock the dices for the attack_roll only
    end

    it "can be rolled" do
      @dice.future_rolls += [6,5,4,3,2,1,3]
      expect(fighter.attack_roll).to eq [11,4,3,2]
    end

    it "uses the rule of 1" do
      @dice.future_rolls += [1,5,1,1]
      expect(fighter.attack_roll).to eq [1,5,1,1]
      expect(fighter).not_to be_disastrous_mistake

      @dice.future_rolls += [1,1,1,1]
      expect(fighter).not_to be_disastrous_mistake
    end

    it "knows how many successes it has" do
      attack.defender.stub(target_roll_to_be_attacked: 5)
      @dice.future_rolls += [6,5,4,5,2,1]
      expect(fighter.attack_successes).to eq 2
    end
  end
end