require 'spec_helper'

describe Attack do
  before do
    @dice = MockDice.mock_random_dice!
  end

  let(:attacker) {create(:fighter_in_action)}
  let(:defender) {create(:fighter_in_action)}
  let(:attack)   {Attack.new(attacker: attacker, defender: defender)}

  describe "target numbers" do
    it "are set to 4 by default" do
      expect(attack.target_roll_to_attack(defender)).to eq 4
      expect(attack.target_roll_to_attack(attacker)).to eq 4
    end
  end

  it "can determine who is attacking" do
    attacker.stub(combat_skill: 4)
    defender.stub(combat_skill: 4)

    # attacker rolls
    @dice.future_rolls += [4,6,5,3,2]
    # defender rolls
    @dice.future_rolls += [3,4,4,4]

    expect(attack.damage_dealer).to eq attack.defender
  end
end