require 'spec_helper'

describe FightRound do
  before do
    @dice = MockDice.mock_random_dice!
  end

  let(:fighter_1) {create(:fighter)}
  let(:fighter_2) {create(:fighter)}
  let(:fighter_3) {create(:fighter)}
  let(:fighter_4) {create(:fighter)}
  let(:fighter_5) {create(:fighter)}

  describe "actions" do
    it "determines the actions and their order by the fighters' initiative" do
      fighter_1.stub(initiative_roll: 16)
      fighter_2.stub(initiative_roll: 25)
      fighter_3.stub(initiative_roll: 14)
      fighter_4.stub(initiative_roll: 37)
      fighter_5.stub(initiative_roll: 20)

      round = FightRound.new(fighters: [fighter_1, fighter_2, fighter_3, fighter_4, fighter_5])

      expect(round.actions).to eq [
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_4), initiative: 37),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_4), initiative: 27),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_2), initiative: 25),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_5), initiative: 20),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_4), initiative: 17),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_1), initiative: 16),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_2), initiative: 15),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_3), initiative: 14),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_5), initiative: 10),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_4), initiative: 7),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_1), initiative: 6),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_2), initiative: 5),
        FighterInAction.new(fighter_in_round: FighterInRound.new(fighter_3), initiative: 4)
      ]
    end
  end
end