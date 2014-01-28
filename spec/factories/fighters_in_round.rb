# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fighter_in_round do
    initialize_with { FighterInRound.new(fighter: create(:fighter)) }
  end
end
