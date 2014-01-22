require 'spec_helper'

describe Fighter do
  before do
    @dice = MockDice.mock_random_dice!
  end
  let(:fighter) {create(:fighter)}
  let(:fighter_in_round) {FighterInRound.new(fighter)}

  it "uses up the combat pool" do
    fighter_in_round.combat_pool.should eq fighter.combat_pool

    fighter_in_round.use_combat_pool(2)

    fighter_in_round.combat_pool.should eq fighter.combat_pool - 2
  end

  it "cant't use more combat pool than a fighter has" do
    expect {
      fighter_in_round.use_combat_pool(fighter.combat_pool)
    }.not_to raise_error

    expect {
      fighter_in_round.use_combat_pool(fighter.combat_pool + 1)
    }.to raise_error Error::PoolEmptyError
  end
end